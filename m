Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAD5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GNB4bDj2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wrRuukdP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tTbN8QdJzbNFg7HFB2EoFWXNNo+FJ0ZvprR3p/0DA4Q=; b=GNB4bDj2P17x63
	Hgk7MiZokZNfN4xsHNlqX7XlS9j6v8jCpYhiYGCCXZHqUnauZOjPWRKsw6sVHaeoU181rBu2XcQQf
	l+d5R/b+THNdY/aoL3Xjcokf2UnKkizAyDaxtRpP39e1IZk2Y2C7e3qFP1vAvENtn/3gLkO0jPdAy
	ZB3QNs839GFkPwKoypo9oJzUfbPDspBpCJKvdG1DO9oQRq5ZDCG2/cyqw6xFgEs8o4ph9SR1Ghwyr
	I9+46wNSOE7RW4qgstUeZ8YEdGSG0kOTH7dGvM97V+QB5+axujA6PiKhMffGz4QSxIGXT2WZSYZj4
	aZaq0dgR+8Tq7hx9u45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Up-00000007fPH-0kPh;
	Wed, 28 Oct 2026 17:31:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Uh-00000007fJR-1Nfx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:31:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so12057225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793208681; x=1793813481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTbN8QdJzbNFg7HFB2EoFWXNNo+FJ0ZvprR3p/0DA4Q=;
        b=wrRuukdPOHhZ9ETo4kDnDH+fIvT6FpVWIiuZSs11rixaLuavFnjwC6Akx5ypLcT51N
         Og0j6BgBIvpglWU3x/cqBWMjUFLK9fUHFNe+NqgeY3a4EGLbCWwqm3j6RRvXY9TNg0CK
         uF7NH0Ri+imaKMDC/Xy1sm0rkCdI2Vjf1uC44Oz63JcN3ML7Wsg794uBG+EkZ2E6HuQX
         1ZkBrqJ/7LMDTNJRChoigpKwfUCuIwpCIXr6L4Zp+ccphIBmYw6ntq+kHqg1H4ribmdI
         hHAgpVAWgA9AZLBa8ozk7q+lEwRm55CPj1FVBJTFs4poHPVsbps8SPDgN6P2GjRPrIy1
         vBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208681; x=1793813481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTbN8QdJzbNFg7HFB2EoFWXNNo+FJ0ZvprR3p/0DA4Q=;
        b=gtCjZuEW4lLErnsXBU0zdqy8yetSdRQ0FnzJXSHvrqd12dM6ON28jY4wdR2IDeUlO2
         rilc9WOHc2AQIgfyJbVprNIesxotCzC28BK+plDGZ83J+npMqBYHVIaOmsnme/I80UC5
         2w1zSiXOvBs8KN71FxsNgcT6Ve0iiGJr01bmFanMB3NCnpiZcPIsGNPO6dDfolKtI2R4
         VEsbSGV1mgXctyVJb/8x6FEbTFicP3Jo8vQ+egKiqYqKBOzlVT83q/39ntiDoXpMwHAu
         vgy96AV01FitbcLztL9ywfcrpEvpzae7TFK8QgFcOKSoxq9yJTS8cqHRbyAfY56ZZHOH
         lJOw==
X-Forwarded-Encrypted: i=1; AKwUvBwuWEg5vMtOxRY93V7rNrBLJupCOw2I0lRW+YVEcbe+SCYO16Y2UbW4TkHd2pbx81xfRa0rGjR/p65n55KH67aH@lists.infradead.org
X-Gm-Message-State: AFq9FYK3FPJGb9zWSAyb0JhV4pdvFqTzwiHmbktkRaQsDRU6vXTXtT+e
	iNA+a0RdalmzLWBgFQD0gQQIWOa3+JdWltlZS87sTWnjbDuH55ROLj5b
X-Gm-Gg: AYBFou2XgM7Rf6n0nv3LDJDPQbuUBn8wyBKRvvu9XKQVuI/zPZJxD2GvDudDRmDjQJ3
	Y5MnxKt6g2TckA9Scfos9RG6RCnwA8hbVb71ljwu76AL7tiqJb3ciPl+KlzuQgR8fnZ/7UO/BM5
	endaoXOX42WkPBax2lxGkwgTbxcxuPX3VRPFWgn5hTjDXaveA5+1wE6xxVE6IcPaS1o10pS2WJI
	PDBQEIdL01ah1gxkjs2IG5AnQ5Etkru3iallu2eVslVfirwBvssCUokfanFerTMfy+TQgN68KRh
	Mjh5sjLsW0lks5bHl4EX5RhNdIGtcQhNljCHscua9P/HaF1FqGDBPFcEXd3Bc385VDMIhrGIlUq
	Pss3eGtrnfhm8uAHi/PP9GvsNAla2xjlQI9NeUXqLxs8Y3yplLqGeav/JRAvpPJAHEhbFhnAarv
	KOTwv0WvxuAZt0F0oVGNKpkvDO4Y5pYVSaxPz7FqFzWVXx5XotVOifSJPJp39dXVkw1Kj3qQlom
	jT5f1osCju7OKp2VVLnM7Re04XB8m46uM6DrEiBZvIPcq32pOxYbOpYQzUsu8DFHTbGiklGcHw8
	lCuwdgoxf0+K8+ikRoFbKlQAPgK2dOp4CFr2nBmQ8Td+al4e0CNIy/PCHqFcYEG/q3RMna5xVqO
	fq0LoNKNAs0h30oIlWCS1+nIOljs21+gUVDmRJH+FoIKdVQ==
X-Received: by 2002:a05:600c:1546:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4aa86a42518mr6057825e9.2.1793208680690;
        Wed, 28 Oct 2026 10:31:20 -0700 (PDT)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80285b2dsm6496175e9.13.2026.10.28.10.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:31:19 -0700 (PDT)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: iav@iav.lv
Cc: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	robh@kernel.org,
	heiko@sntech.de,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] PCI: rockchip-host: Retry training and hot-reset a JMB585 on RK3399
Date: Wed, 28 Oct 2026 17:31:17 +0000
Message-ID: <20261028173117.3457220-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <ff204558-dc22-4d38-b0dc-2c727f983f9f@rock-chips.com>
References: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv> <4316c1da-f7ff-4fa5-a330-512800474e45@rock-chips.com> <20261026-rockchip-pcie-shawn-reply-1@iav.lv> <ff204558-dc22-4d38-b0dc-2c727f983f9f@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_103123_409130_1BD7B30C 
X-CRM114-Status: GOOD (  10.99  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

You said both SErrors and synchronous external aborts occur. In my logs which
of the two you get tracks the cluster the access runs on, which might be worth
a look before you move the hook.

Every asynchronous SError in rockchip_pcie_rd_conf landed on CPU4 or CPU5, the
A72s, across six boots on two different kernels. The one time the same read
aborted synchronously it was on CPU3, an A53. They also carry different ISS:
0xbf000002 for these config-read aborts, against 0xbf000000 for the unrelated
runtime SErrors on this board.

That is one synchronous case, so not a law, but it is cheap for you to test:
pin enumeration to an A53 and see whether your aborts all become synchronous.

It matters because only the synchronous form can be repaired. When it arrives
as an SError the load has retired and there is no destination register left to
write all-ones into, so no fixup can help.

I prototyped the synchronous half in September: an exception-table entry
consulted from do_sea(), with the driver substituting the all-ones the PCI core
expects rather than only surviving. arm32 has had that for years --
imx6q_pcie_abort_handler() in dwc/pci-imx6.c decodes the faulting instruction
and makes a read look like all-ones, under #ifdef CONFIG_ARM -- and arm64 has
no equivalent path. It only ever worked for me with enumeration pinned to an
A53, which is what made me look at the cluster in the first place.

Not proposing anything, and not reviving that prototype. Yours if any of it
is useful.

