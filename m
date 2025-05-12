Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C801BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uEhCIePExxYdeEFo86ngpZnGd6c8uwRE4+wkzGVHu8=; b=ODhPU0xdzGYRnRZ2xHf4ld/JaW
	XzibIw1J0YLFqM3C/jiZjEdP37uygi8c3vRe3uVbumBQqXECN9rdoUQiGvSVHjuNMoINdUGaNJ4u1
	hol/aYM+zZ0IpfXNVull72aVZz+ASK06r3NVzCKvSJiNmMYHZqEICH32+fg5Nv4Mruoo9Yp3/e6n/
	CYBA48nCeDq9BA4CGDAihzEXIwXP9nVinDYXD0vUGVEdheH6zdVP4teBOQrZkPiJXFt56pU5Oa9d5
	vE7B7NOy6gQ3jV8P4JFNU2xgTqg0YmboMoJZ9WbLbr61oxFgA93lFFlaStpFUwb2H4mETh/3rQTU1
	4pQxY+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbbk-0000000Aq7b-3GV9;
	Mon, 12 May 2025 22:26:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEb1W-0000000AlvJ-14zp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:49:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F260614BA;
	Mon, 12 May 2025 21:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F874C4CEF3;
	Mon, 12 May 2025 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747086559;
	bh=C3G81qrv7/1vX1M5v42kE//YoE6ndcm9EiYPLOoN2Ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QEtubNxr+eEj63xi/ebEFe0eRwKoZZwIZFOt7BxtLa4kB9MWXlJOptYAbNhEq1xWc
	 TgxQOjUGcl0+ztD0HEMgcHbwn8rp5P3vMdaZywMT4+WpJgoFwXqoYKlyvdG9X1v9lW
	 VSYgw1AmVVa9nsB1gklZy1gFsQcUoehjrIIuoroauhyR8psHOQFfT8Cifh7s4XTNPa
	 JiCofIyn7VPc+CU7CdTxtmEUJRrDghrVuPkDShxi7B1F7m7KDru/RJHsof04DYbOpV
	 VHeLDUihKXSscRaEzAXCIH/W60foyvlC7FJUvnUrWbtXk6zD+E3cxw2B5OxH2jlX/t
	 H4w7lzNpyhZlg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Moto G (2013) DTS updates
Date: Mon, 12 May 2025 22:48:53 +0100
Message-ID: <174708642735.3671.12706246098012962690.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Thu, 08 May 2025 16:11:05 +0200, Stanislav Jakubek wrote:
> This series improves the accuracy of motorola-falcon's DTS.
> 
> As a side note, I wanted to ask how to describe the Hall effect sensor's
> vdd-supply. The sensor's currently described as part of the gpio-keys node.
> According to the schematic it's powered by pm8226_lvs1, but I don't see a way
> to describe this as part of the gpio-keys node (maybe it's always-on because
> of this? Downstream describes it as gpio-keys too). Any tips?
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: qcom: msm8226-motorola-falcon: add clocks, power-domain to simpleFB
      commit: cbcd04ab82c61dc777a4b56014292b9467f10c4e
[2/4] ARM: dts: qcom: msm8226-motorola-falcon: add I2C clock frequencies
      commit: db6e3f2ba0bf6ad069347050ff62f29ef0d88b14
[3/4] ARM: dts: qcom: msm8226-motorola-falcon: limit TPS65132 to 5.4V
      commit: 7bce56fd73ee7264ed04418dab1719164e42f113
[4/4] ARM: dts: qcom: msm8226-motorola-falcon: specify vddio_disp output voltage
      commit: e41ece7cd173486f6767de050deb2d8f0882a82a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

