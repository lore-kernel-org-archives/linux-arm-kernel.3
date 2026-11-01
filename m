Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A2607410C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ce5iwmsU;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=NufQ1HcX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F/IyEYtIEFa/TSSICHUA6hake8dumxxKR9SArxaMuJA=; b=ce5iwmsUyrA4kr
	Qcqc5ey+q86FCNHRZiS1ivyUPd0JA9jbO34kZzHuS3mgeQJnVAm/+UkQhpP40tprkfuTuUlYqOWbV
	3XtGjfIpQO4ItNrtJLAq5ZaEPSd19mmaRG3bwd3qf7qhYjGlaPYakp80M2juVgtHIwJzD6J1cF+aC
	xvrKwkUKUjRbeABuzOz/F8igdhcD3qB1xBr3xGyzOWI6P/Q2dfTBLlm2aMQop8jNDTxZY+r3cl4te
	6Gmv7aKdF1GDFB7cU6NQgvDUf2m4qIyNle4U0ghEfm4HGBQwDNBB4mfyTSabqvIoe9P4uWhkXxq9u
	q4Z7+WbqpKEMjUDyApGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrE-0000000F1go-2hQR;
	Sun, 01 Nov 2026 22:16:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqh-0000000F04B-3EkG;
	Sun, 01 Nov 2026 22:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=F/IyEYtIEFa/TSSICHUA6hake8dumxxKR9SArxaMuJA=; b=NufQ1HcXo+KRWDRaYcMIG/RT9p
	9lRzNZzE7HQmPTuXKYoLqVtnecUNx1k0QugPc5BQ5N9tCEWnkoivCeEJpkxaEv0IPHUKxgXbyaolV
	lGAXrgdLG9UBB8qSPDW8yJG9Ht3ilyx8UCAVMH9fIdlpk+s9MzNTg6+dft1rKj7uXBmq0qJAxdead
	f1tc30c3YGsksoFKVOGgataIERHmtrP9zd3ka3NF8+bIyrd3kMK9SJ5GPdCK+t2qzYi5bQrLG/yyq
	SZGeO/u4XR6OOBnPKlqaTAyISgnvvYjxunFFR82v5pt20AsJUQsDkDCDknc4gLWtL7mPhVGZabf8h
	QIne0bZA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3568-evb1: enable PCIe3x2
Date: Sun,  1 Nov 2026 23:16:13 +0100
Message-ID: <179357136502.4108155.14807945723272231784.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1792387349-86262-1-git-send-email-shawn.lin@rock-chips.com>
References: <1792387349-86262-1-git-send-email-shawn.lin@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141623_861193_DC3E9D21 
X-CRM114-Status: UNSURE (   8.88  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 19 Oct 2026 13:22:29 +0800, Shawn Lin wrote:
> Enable the PCIe3x2 controller on the RK3568 EVB1 board: add the GPIO
> controlled vcc3v3_pcie supply along with its pinctrl entry, and wire
> the PERST# reset pin and the supply to the controller node.

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3568-evb1: enable PCIe3x2
      commit: fd485b0b11c86be0596c9b775d785c548714656a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

