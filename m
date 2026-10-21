Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19D3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M+wPYV8T;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j8rmS0Bg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=; b=M+wPYV8THEsaCJDQ7etLB9r6wd
	GWdS2JvYD4h+KlVPT62rBjFRae/53x373AC4RsQUDf1xRrcEWXTwm+afNDU69VtznsvtCK3jewFZa
	sS/ntWBW0N7JpPfu3gvAJU69SFSLW9PxdKY14nUKT7FlG8BSoS1yZPqpSN9PUF84QHWuAmn7TxuV/
	JKmfV9LJMLBM0pajUZRR65whIj7x8ZfhXvnWa2IZeY1gWdv/riae8mUJSEkWV0b13unYQyRpnoftv
	YOJTmhSDUKJt8spShqK5H12ywvuk+J4/hLMkApcXJAEP/EPDVFCd2WEJuQLo9v+5Jxjp7VsoiQdt9
	WGeuJCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTQx-0000000BakF-0tze;
	Wed, 21 Oct 2026 10:20:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTQu-0000000BajZ-1pzM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:20:33 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso2548025a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 03:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792578030; cv=none;
        d=google.com; s=arc-20260327;
        b=gKmm4cJ0P+94pqovdnU7+0pbEVV6RBGTcimGsb2rg7nff1orn01vg0cWWlwAYbo1MD
         NjmhiVSZZ+iBAQR72gEfUokDD3kgslcP7HRgxaRrLW6KDi1c2y+S2XG/0W20Uy1uCPpO
         5Kg4m5Ef1Ku56eKk4wPgNekTBpj1XbSqWfTjaS3G7Cq3c8YWwTlUbtra3sRqG0KpKVNT
         4jYSvsQmSp3AibRdapgkuijl5ONd7iJJs63rawckafHUnkWjPvFNh8M1/ErVLJihZAJ1
         Ss+RIDjl8Eo6ef0gHshCDbCdqgBVvJQPbazmAy1QDp81wZZ7BPVJYw3OrIL35O1zW6LW
         54dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        fh=lyt1b8M4odIbblWyPzSs2lx9yWa8hDcWq5J8D6CdlBY=;
        b=spKkppOWy4FMbHmRXFk2F7XxnAr3W2D3SwEmNlrtGbH3rnjIvKoS3qUzNYof8a4uxC
         lkfP5IcH3CG1au0Fb0KnAd+EMbjWf8jxA07cANSQyHADBgGJLYsrRx1HczxgOYO+lzIv
         HWVKS7vNiKowtrBZpmS0pVTOlBdp1xTBtFrAsZ7dc+abC06L3LAtSiUsMgh9+/yB+cEF
         hHG3wmTi/ZZalXV4VLA5y5BQTuh55KEuTYTFsHIWeljzXizKB1XAaZ0pBaQlbTca8jDy
         pAwESwU5ejpYg/cGoZJv+4DqWUPDLJhJQMQa3cYiwqc5vF6IZ/QT+lDoKjVPGeu11axR
         aYUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792578030; x=1793182830; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        b=j8rmS0BgKJCJGXcxvwRkux6jd0rijBZm93DnTFrPNW/WVjqdnLKPj2HRxiIcqlIMwk
         y/7SybL7fXlH3bqWjnNLHuIsdi3aGQc/d3LjQ8xaHjw7Q4FBXV1NM0x/2U7HYUmNq2vt
         QXiQKuPoJWF8/6a6JJvbzUE2FUScbXqaIU4eAkbSOdBS2mgzZqrrWqaPboTtHX2tonL5
         JC91D2T0xhrWw3u/uARlSodc711+WVi6qBg8kZWv7b+LyZMGzPOu5N0e3Zq9eYnkTpyn
         +joGw6lpKq+ZVWALu0aRWMjfwueOBBHm/H6Llz8oHBv5FvLRFOnon0yOCSWLwgNPQoU7
         b8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578030; x=1793182830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        b=Vbfzr0OQXuek0F8xjVPOHpl70t1WdGILn1eKonM0lXU0xrT3e5tGamtn8k7TqNsoLy
         le29qZsj0yf8o6H+VyxdT85MKh2NWu9gcqKFJdmZ1c9ws0La5SKuqXICZybmWXK8TFK/
         293R0x1czCk1XztWrRGPz+iYM4JlYyv2mm/VCJl/awUuN4HVm2RsohRNZQ/hT+jtxKbJ
         37JqrmeeNSTUGIPBYqCJwAE0rfnAqUi4ixvoHlHG1L0N2b3Is5DeV6uti3NKD7lmJ7RD
         R4Xi8kSDZXjwqmupwJG9LnXojRobu04x3Y7FWnJCR1f5IAIF2Kx3FtCuvJ5Bo6HKEVb0
         14lA==
X-Forwarded-Encrypted: i=1; AKwUvBz3iAZ5w0f5OinqY/NOVUxE9Dgx2AizJwkK9rS6qlsm0s7eYZzoGqUzyfBhsGvjJdT53rCpSoK2Phgqvh4mFUx5@lists.infradead.org
X-Gm-Message-State: AFq9FYLZ970IlUjaqh1ii6N6XZrpDfRHPbWCX1Womgh1tajxcvsxCTVB
	hO5GER3X3WGKNmmdvJelRz4mYwv1CjowMYQ64RHW1mQ6SzM0H7vbHS3Sdm8cidvdXJG+Z2jQdLN
	eQgA4i8HCQ+HFXsM7UtPsCO1DztxcP8A=
X-Gm-Gg: AYBFou0NjwXyMPb1KZqxbStk+p6/vxbaENwZaW+rlS6uCpXddY/QgN43r6lUQSwfscl
	o2STex23fT5IBM0couOGTv+6aiz/beqIKspA9h5A/y2jUekGReBHDFrJjm3uswDVMAqiRomLocp
	bPha8Q7jdGgOt2df2fV0EJjxzIjhQcIsjsskwvjgzR8ICSFj0JkzjkhCFQ/a5sMK7F9pQKAltoE
	Uekm5v0Zm+1jyZbWEYc4Qpgz0oLVBkfH8tDk2pgyuY3/jofuW/NAVXPgqfr3sVZGy6cL+IuGctC
	O1Ev8snglBCLFdAjb4jXLc0LrpZi34/C5a+QQr+MZag/zMvHUEb8WZz36l+GGegvE71HeUzW4JG
	kNgbqLrDTzWc+soU888edzo0ikplXym+VOuiH
X-Received: by 2002:a05:6402:1ed6:b0:6b3:afe6:4fc1 with SMTP id
 4fb4d7f45d1cf-6b408dc32e0mr1130962a12.2.1792578030234; Wed, 21 Oct 2026
 03:20:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921102522.1640072-4-akkun11.open@gmail.com> <20261021094542.59417-1-l.scorcia@gmail.com>
In-Reply-To: <20261021094542.59417-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 12:20:18 +0200
X-Gm-Features: AclHuK_9WSUvbl7lxj9ijaAvYmNx-kmxqZkezsuL4zt-K3i_hWfIEDEOQ1AATPQ
Message-ID: <CAORyz2JODezexX2ZGwDk8LcBbFA+Jm0hRBAamJ7Nmk7Q+a4R1A@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
To: akkun11.open@gmail.com
Cc: angelogioacchino.delregno@collabora.com, bhelgaas@google.com, 
	bmasney+clk@redhat.com, dakr@kernel.org, jbrunet+clk@baylibre.com, 
	laura.nao@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	nicolas.frattaroli@collabora.com, o-takashi@sakamocchi.jp, sboyd@kernel.org, 
	sjoerd@collabora.com, u.kleine-koenig@baylibre.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_032032_485317_ED960E88 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.4 (/)
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

I apologize, I just noticed that your patch adds the "_dummy" suffix
to the clock name. I had originally applied your change manually using
the DTS clock name "hdmtx_dig_cts", that's why I experienced that
error, but when using the name as you sent it it actually works fine;
the additional dummy clock does not interfere with the one provided by
the HDMI PHY.
I apologize for the confusion, but at least I can provide a tested tag :-)

Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

