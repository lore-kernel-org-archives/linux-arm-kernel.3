Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E15C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GeoGrsmT;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ob6ZXa6z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3Y1UNnJLUfF4IHPLVKAOakcJbI9y7VNgBZgpQW6I5jQ=; b=GeoGrsmTNkWblGAjIYxEBp7EoT
	4FCboW5BHrNDscCYnF8XqozYTj+PEIN4n3PSxncB71KH++GgRnrGpxZ31jh3ds4HGcdjHZOj45V1z
	zbcKxIKSJP7z1Z2NO/jZ5qAIAZ00lLlQEldAt5DypJEEqk75fg2yQisDNH1RTAl/4qmKKmgkkwl1E
	8sTPc+H/CvMZju2XN76Yi0ES1NC5dj4+IBTv4F2CaeUiPH9Aj86BQ1Pmz5IuHC++pALdZZU2ZEFxR
	N96J6ls2pwLJbHrQCP90rb+dWQfr7LqcMZc3+0UEU+GNah5ic8p9aNl0GE0SL601OhHZucUicJ1qT
	tGdfX8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKARI-0000000FuKX-2gOr;
	Fri, 23 Oct 2026 08:15:48 +0000
Received: from out-112.mta0.migadu.com ([2001:41d0:1004:224b::70] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKARF-0000000FuJq-0Meg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:15:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3Y1UNnJLUfF4IHPLVKAOakcJbI9y7VNgBZgpQW6I5jQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792743342; v=1; x=1793348142;
 b=Ob6ZXa6z+Shtn/o70ofJ6MLMuWppAPOomeGXjXF27pEoFqMjHap/51bHj1q4cS1joihbD+XR
 7a19LR11RLuSK/6kKQnQReu9i18iIe24D9R8Spg2UxLC27iKTbcwtx1arADdxUZ3q0y5f1CTeV/
 VWmjmz6DVbYC3mCRtEvQo4Y4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e7d1c35a33b1eb04;
	Fri, 23 Oct 2026 08:15:26 +0000
X-Mizu-Trace-ID: e7d1c35a33b1eb04
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be58ad9600so6018e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:15:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+5mVPR4PDbrgQuO5pgFwJQeeX3bTMkb0C0Sv6OvT0aXoP+Ip/my52Xs3zodSdbDDEavU1JC6DdzeZWCJyzb76@lists.infradead.org
X-Gm-Message-State: AFq9FYIUDIRsBFMlX9Mvbjra83VMf4a7/qGiMuUaZdCy8GnPv/IvF1KZ
	h7q3R+wexd7eM+hW8BLrSnPXe3EDYWwDsA//vwlx/kU9BiyxcK57ss3BRIw1R6sixGRnvuMdcmh
	GZZ/INByg4yxziX22xuFSj9dJ2qXFs+hqEXPhlpeh
X-Received: by 2002:a05:6512:2399:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5bfb00b65e4mr104760e87.4.1792743320286; Fri, 23 Oct 2026
 01:15:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022140048.2522787-1-vdonnefort@google.com>
 <20261022140048.2522787-3-vdonnefort@google.com> <20261022173604.3710390-1-fuad.tabba@linux.dev>
 <atsT4c-JLRSxSreo@google.com>
In-Reply-To: <atsT4c-JLRSxSreo@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 23 Oct 2026 09:14:44 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw6yONFTYBbbwBbV=YvYC2Wcio-yCOf9WCcvTUKWeav=g@mail.gmail.com>
X-Gm-Features: AclHuK8QRPswQkmU_NO-o8BNrXH8cgfaj9wb0MoWlEnDaWgVTOs_RkNMpHxX_IE
Message-ID: <CA+EHjTw6yONFTYBbbwBbV=YvYC2Wcio-yCOf9WCcvTUKWeav=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_011545_638335_BE5E3DE0 
X-CRM114-Status: GOOD (  14.05  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 at 08:59, Vincent Donnefort <vdonnefort@google.com> wrote:
[..]
> > Could you say here what happens to a guest when an LR isn't reset, as I
> > asked on v1? Without this series, on QEMU changed to leave a pending
> > vINTID 100 in the top LR at CPU reset, the guest warns "Unexpected
> > interrupt (irqnr 100)". With only the EOI bit set there, the npVM
> > doesn't print anything in 150 seconds, since the maintenance interrupt
> > is asserted on every entry. With that in the message, could you also
> > bring back the Cc: stable you had on v1?
>
> Sorry I missed that.
>
> Actually I don't know if this should be backported. I believe it was working
> until now because all SoCs do reset their LRs even though they don't have to do
> it.

Fair enough, I'm fine with leaving the Cc: stable off.

Cheers,
/fuad

