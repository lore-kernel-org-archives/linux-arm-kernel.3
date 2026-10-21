Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F9C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EzzZD23b;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lmaIdBzB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ko9HS/rgq/wRVG+QBYDoQ9uLj3LrUPXzZbkboW62IRQ=; b=EzzZD23biNEBqM4HTTJmQ0CBUw
	B1S+eJFYoNIjbhpxO7thTa6hPFvuqy3DOpjOYoheRDL3FYrT33tkQq3SY+0XBkekHT0BexjOSuYT6
	GW3F6+aHnwVWpF1f4H80+z/NA+N+asq3VNP87pEiw1/f7hLHllIhkdzvuO8/EilHhtGxibLvv1LMw
	q/Uy7C0YcmmXxBlQhwN1G2Jx+UBsTu80FDtshCfsnQqOJme4mKDaUQ/WvZTDgwI0iiLOmjy7BZbQ3
	cogRhWdSxFX+Oz4gE+ww9AAI58HOya6DXhaMzsn/VJ2JbB0/3TDR/8gcgG6AHzPchAvgXSk3OyV+O
	b14+2Lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPbo-0000000B9vh-0k87;
	Wed, 21 Oct 2026 06:15:32 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPbl-0000000B9vA-2SSX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 06:15:30 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-677d35fd1d2so352517d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 23:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792563328; cv=none;
        d=google.com; s=arc-20260327;
        b=N5xWS95kahRv1xDXs9XlQ/rmizZF08IKrFbNQQ98hpCwK+e+q2GNNNRPFt0tBZ2hAI
         CdwSxMmZkAFpa3ecYr10NUyLZxOAnpyqc4pWJE9ws/bK7xHRzuOm2PAP3OyWAmdlHgMJ
         AlecOdI5B5+vcXfA6ghCEI9J/gmghxx7HFEV8pgjO3b3JajVtdh4qFVnxJ77Nh5NJZLV
         +qW5PqPutNiE7fYMG4evjxr0iIg2QpstxuK/XLKe1AX7CqAuqbJd8cjHi5ovAW51qSrl
         ChDnSrEg60mh5hRSfVNzoPRo24P0ATTA5vZ4NITM9Jhna9tAlXsVycHNT8n8WL981YrA
         4cXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ko9HS/rgq/wRVG+QBYDoQ9uLj3LrUPXzZbkboW62IRQ=;
        fh=X4zoWpWP8mXXxa3E2U7uKrKcdR2+lLMEy/IYI+6Ki/o=;
        b=VVg8TohwoJzj2wLG6IdYev1R4x7nccX0EjVEfOfXODBdw78w88DxlVipABn2k6tAhX
         jFY0x75Q9rh/ABK5Mh/85I+bhmw+/SoIlRwVhMVNdi6FGX2vimTxCXzrpl77WaoLC2eL
         4HLGeroPS+XwcCcV5aADBJFudworzsVQFVPmjBgzBwh16LA6BRi6ghFU0Tb+oqYCjhlP
         CMKVqLidvy/Z5DJj6KqQl6BnbCPG/4OWw/+e9s7ZwshxLSJxLf8m3J/1Zf+xqcN2xJAC
         XfJaPU0BwFjOyQiplrpDqfYZkhXWiT/YGr9KBo/E6NAy61l6cO/ECxeGU2lDfKIdqJ2B
         snFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792563328; x=1793168128; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ko9HS/rgq/wRVG+QBYDoQ9uLj3LrUPXzZbkboW62IRQ=;
        b=lmaIdBzBmp09mmaavmcPwq6l2Yglr4sC4SbbKbRxJmGAGeJAEtizYFIKr5PeKZSDql
         MEbOp45CO3ZYCLBf2i/xqDVQMZWCaaWRhJDWyAxH5fp9q4LXY1g6vEBi8zpbA/XNJIKn
         LF9/wBMhXi/hjMchVyIdy57z+bho6h55OBkr6IjZ0FRTb/HV4Q+fyzBah50pBVGWyDBL
         shDqoesCeKr2xYL7FiN07VFIF+UjQpCr5cSccX/hsclbmfKc1D4SqoeF5GMVAQ51/ace
         U+AkVpWfvuXq1WhaSCC+S/nu2iHTxIiQT3WswUvAj4FaMo641c8IeL1GO4Ub+7gP5S9F
         G3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563328; x=1793168128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ko9HS/rgq/wRVG+QBYDoQ9uLj3LrUPXzZbkboW62IRQ=;
        b=t9W3RDgAB5O/XUiBi5KSJZBSqS9Fd6tuV4jfQr1kf32dcZBFuVNyotkBDxfcviF8Ic
         R06ECCNmTE4rf4rfdiPtLq2sLk/cVZeopcUSYgJX/mK0UdUw3nQU3ZjQ4uWWb8B+6vnc
         p56GFpqgMWbVMM+QhtrMUUWcws1cVXMUscZKVfzcFSfrs6D2EZre9G20npHFH2dBAe/w
         XpdH2F5Ofe+BSuQm6JuVHbdljeCRFtCiKRbbT5Gxm7bOnYXEEzMN7E3Ja7SG0oLNdYWi
         vCLd3ysI5em7n4ZKxN1LG3ROdEOiQscZQuvRFYT2T8G8+LsHLsp05Suss94pi7s8VtUm
         gm6Q==
X-Forwarded-Encrypted: i=1; AKwUvByRA8v6sPeC8kYht+j0n6nfRV+xPhloi0MGxdj1tSew79moTwmRv4dYcICBiZuR4WNg1as+Y8z2l4YZaLuFSWtX@lists.infradead.org
X-Gm-Message-State: AFq9FYLVDsKjDA2pnCXzO1bdT50+L8smJ7TTE67vSIXVoVp2R32+VFEt
	gYQRPVxWNQWWyr083qWcwNcsRwMVi95WOhEADUJjVnvZj669cZv+rFMCsSisITU4L+rI/Smi6k7
	Fh4qPMGU5FBIxm4qgYB0vBcHmjaW6Y5mt/Fau
X-Gm-Gg: AYBFou0cYRJBbaECCiAFxbzFjhb42W09YZNyHAQfFkhJpVxvUG+cZYhh8pCoiQSoPC5
	pblWFQ2vMgThZZzTPtQPXJaEAcqoAjDDKQ2pXwtVuqmLeYlQQ+mqh6CHYDhKNcko/i/elCZVi+M
	jB5A1017dlCtj/3CxplUUTpViyKTW6D62WraucNdzOpatRGL8YazvpUvd3+oN71o/GRF6iTtYJt
	/dSrU6Fd3WBk39kv+oVC7H5+myBFb0/22halaq7B/CaKnB10OPgHR3QAZTXelw+G4OyPC6ZHDzP
	Z/kcer9uHHlj8aMiCpvQCZ7IPb/+sWG9jrLvbmJPjbWyrKUSdvbhGidCKv85GVwQvKSltzRMu6b
	HtAeKRwvYKmpK/8Yp2/8SqwrwnISHRHiM0X+d/A==
X-Received: by 2002:a53:d046:0:20b0:675:3ec2:25e3 with SMTP id
 956f58d0204a3-67a0e4ad344mr360129d50.50.1792563327812; Tue, 20 Oct 2026
 23:15:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com> <20261016125229.1798791-2-thi.zirnstein@gmail.com>
In-Reply-To: <20261016125229.1798791-2-thi.zirnstein@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Wed, 21 Oct 2026 11:45:16 +0530
X-Gm-Features: AclHuK-ugPzahDAmlROiGz1RBDDjU0-2VRqDCBg2WtlQUTxJejI8BYEhLT9FIjg
Message-ID: <CAKfKVtHXPmFw_x_rzNQeunyudaaw_AQMYgcmvFVzM_tRfp_+=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] i2c: i2c-xiic: fix clearing of bnb irq
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_231529_631713_ECBEC741 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 6:27=E2=80=AFPM Thilo Zirnstein <thi.zirnstein@gmai=
l.com> wrote:
>
> Add a function for clearing the bnb bit,
> It waits for all preconditions before clearing the bnb bit or times out.
>
> Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

