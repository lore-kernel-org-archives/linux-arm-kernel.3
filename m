Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344D960A2601
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uS9S0vmV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yg28mQrp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RzVoRzg9xe4PHgIpm+qEezcjZDbm/lhClesTNi1L61Q=; b=uS9S0vmVd4O07P
	4tqWz/vp7CXpnqzY2TfSfouUWqPLWcAXvmiqjHYLeOALxlicSScvks8jCUSXCi2CUPyojHmMBPNqJ
	dBq8t0yiwmEwl9+0tfLA7AE98kFLQ9r/3oIhC8oKT/a2RRQh+kYFqHxeaq96r2rPhdyp9uxL/wr/s
	7SOitqkIgNiwwUJO2EUkUi4ZEWox5IVfXvHDqJE5FL3Gp+/+ZN0HBcXxos3zJ8BCvJhjGoKQ4J49d
	96l//8wMU8IvihzIIZvGCz3a6sv9al1weAObARHoZ2e/oSmYHMTXw7U/cOu0pTa2Vt/Bz7iD0pkAR
	vyhGruual1z1rVusTGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrFa-0000000GV8i-0xpY;
	Mon, 02 Nov 2026 12:34:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrFY-0000000GV84-3yMd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:34:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2A144393B;
	Mon,  2 Nov 2026 12:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2A31F00A17;
	Mon,  2 Nov 2026 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622896;
	bh=RzVoRzg9xe4PHgIpm+qEezcjZDbm/lhClesTNi1L61Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yg28mQrpwDmuTMuJ+UgdYXOZ+dvc8Ebni/8dbFPNPslIaBxVdejVKto8c+TPsWCDe
	 hvS/GxsNJSluYIryH69FWRSv0ShsB+egJeQLn1/HlpApu4Gj//s+3rmmOZgUvZdoBH
	 Cbm4SuiDPcty9IN6wl+7e/icJD46sf9rjhgOwQ2XXeSFqho35T+z0mZHfqNpJ0xkKF
	 /Tn74maVWVZFTMCHEL6zZ6hyh+ShYNqlILevG60Tfz05Uv5pfY+Lcn0BB73BvAcKtX
	 eOqK0C+jwh5gysfprcKFc9putRFr2fvzDTRWKRPFqUE0ksXwFDQxjUtTG+jZUArQ10
	 Yoil6Md2cv3Cw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Artem Utkin <thesame.personal@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4412-p4note: allow powering off the wifi card
Date: Mon,  2 Nov 2026 13:34:12 +0100
Message-ID: <179362278567.150793.8365404184056648906.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026-exynos4412-p4note-brcmfmac-v2-1-14b372972163@gmail.com>
References: <20261026-exynos4412-p4note-brcmfmac-v2-1-14b372972163@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=666; i=krzk@kernel.org; h=from:subject:message-id; bh=etaCVO/+UgYS7WSwutu5o7cRUm5LN13s38rYuQKONgE=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6INES3aj/pbzo71zEV6fwLpMh5E6nbYpHinso OZsrqDuuAKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiDRAAKCRDBN2bmhouD 12HID/9lN6oLnGgySgl9mJeJssysWKx24Jq0f5lwe5NUKNe4At4gIJRrjFQkyCCm/ifblAyWhaV JAYy/NAr2K5MB29iS0HX9n2TL3Q+gqAxcqSOEvp2axGrCno/IWYuYb0dwJpIraXPk0XbUB69Hhn vojCCoMlhTHgpVJIOVSsGpmSIG/4+Xv1aIvdMPCuRk2GYgX1n1f1XFY7NKBX2A3Tz3/xfEx6uTt lRZn+c036BfGvDKLwl/N7ueQh+fISnnfPuUxsnmcO71mExrq+RBEcX881rl/C6YK3eYq5dQi2S7 3IzbbHoiR4NvftY6wVmPO6w6SHHKvwneJNd3EVQstmOAHBrsvftsiusgYJBctcEB8r6r8WnEKVn V6W4kL5luk2nzkmMw69cU5S2pMVl4CNfHS36ZOGuTH4Wl7U1JNIIpaKSk9ApGQ7QF0pUsTnyKEf ym1y0Hdbu34vJjL/GDEyatn+c6g5ONHJiBx+zn8e/P2CQThRjptfixD+d1O5Afw5xGtPXL6S1p9 Ky3iePsCFEtI51mn/ka8SFVE8LcvJqukHBoTxxN95Y6cJMs3B2dBFcYXSgTtZVRTnjzArrni5vy 4oCeTQkrRYoCCPgK0a1FLa6o52/E/JQvZKaYoKeSVmEvdkIiTPWgnXkgCFpxmK54lFi0mMCWEz/ rjzgsFOUBnLMJu
 g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 26 Oct 2026 17:09:14 +0100, Artem Utkin wrote:
> sdhci_3 serving BCM4334 was missing cap-power-off-card.
> On my N8000 this resulted in the following messages after sleeping:
> [305.759883] PM: suspend entry (deep)
> [306.514698] brcmfmac: brcmf_ops_sdio_suspend: Failed to set pm_flags 1
> [306.671504] brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
> [307.127267] PM: suspend exit
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: samsung: exynos4412-p4note: allow powering off the wifi card
      https://git.kernel.org/krzk/linux/c/41fb0e8f340f5b883b67786549a48ff60bcecca0

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

