Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95180606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rr6LfRVq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPQ8viCB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ciP3TE41VRL5tjg8DAT2gTyP12gWWUmxTZcVY7OvJgY=; b=rr6LfRVqIh6JRK
	+dnAG2wMCF9WzBPOhRfiWnNkvUxd0RQvsA8Tzx1wzozYmz5qgH6mcLjPI9Hvrm2fvlMI3X4x1rsSs
	QSievzu9XawKczg4ELmln2hbaZx6zrUyasz2xZVdriF0A72KSLso07rX+B4kbFQW19GGr1LWbKVz7
	Xgt0Sa0bCQQcjckxSavxobiPLYSxgUlpvK6Gkw2qf06R8pyVxalVx7RtWPh99m3YPPBEk75OiL67l
	vbPMOrmLg8uyN8VzqkMKumtw2fc4WLCm6dPDydEx0dK3/vjahLK/+7ZDZbltN61JZrtdQ3c9I/abJ
	U3osUC4SXsWIiNM0S2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNT5f-0000000E6Cx-1wio;
	Sun, 01 Nov 2026 10:47:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNT5e-0000000E6Co-1YgX;
	Sun, 01 Nov 2026 10:47:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D358541577;
	Sun,  1 Nov 2026 10:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130B71F00A1C;
	Sun,  1 Nov 2026 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530025;
	bh=ciP3TE41VRL5tjg8DAT2gTyP12gWWUmxTZcVY7OvJgY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=gPQ8viCB4Ijdtj/k6DT14L5vKt68azQvaBCmfH6mY6rEwPQ+JOw36FMZdzBO5JbCT
	 2FxN6rRrkwiLY8ck1MOLtgyBgx+gSRkAEKBYvC5k2aJZTD2lzHmKDS3kSBw4po1ZUM
	 hLA62Q5qGf9MJ8wNegrrh0Ao2UWbGj6Q6O1x99R8PqYdHbIBg2L5KnBCi9QhmiHzQK
	 +4sSzs+qyyioHVAZFj87+YNVxnMseb7VBn1xiiErYTmApQt/TWT6Kje4OCrSsO1JZf
	 mc4SZvWtAG/tOcVyifdgqEAx1OaA6mZX4dAXwI2MQSFgb9SsqmZGK7QARBeKpM9/IE
	 29G0hJmxIz2cg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Joy Chakraborty <joychakr@google.com>, Roy Luo <royluo@google.com>, 
 Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
References: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
Date: Sun, 01 Nov 2026 16:17:00 +0530
Message-Id: <179353002024.2955.6740233289022296167.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=522; i=mani@kernel.org;
 h=from:subject:message-id; bh=u68oHDWGblhruYjLSJx3Jv32NsrVXxV9GQhKtKCHDxo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xim4E4sFKagT25ik3q1L/btEmtp4J5NC9Dsf
 UZiDt9q8dOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucYpgAKCRBVnxHm/pHO
 9SW0B/44Apffz+7OVHoYH9pH9J3ihL2WQSqT/ZCjV6rQFEPHF9qI1YhioOnGALvFodaDOcFI8dj
 TXIZhJ9NidcjujK7zDLglaKV7FsWmclAj9ch05ML8rlVnrIaxEjSlq2hnqQjCvLYSktFVguE0WI
 LT2LsgNUXNFvdLD2dP1Hav8gSiaCqdfbq25jmr+ktrRU5p0RNxhbKOPRCgbbXCfpOgCFZk5ROPV
 wleR0IuHLEQupJcAQkSD/sX38yqMTC8E02KXMC9gPJSf3ilvJaLtLcbzihCDC5jkMOVGrPt5LXp
 mXo9Rd7YQSRAvqXwhgrpki0/SZ8ZNPZK5MdcWwRprhn7p7Fn
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-20 14:27 +0200, Geert Uytterhoeven wrote:
> The Google Tensor SoC USB PHY is only present on Google Tensor G5
> (Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
> the user about this driver when configuring a kernel without Google
> Tensor SoC support.
> 
> Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



