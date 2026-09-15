Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D13C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErkzZ1ZFOtFbK4HOjtmx0Rkzf/fK40DMGc6473S3ltU=; b=GPht2BSs+RvezBvA4TGHAlgAjH
	dpG7EtFC8loYVJgI+WdwJnXHZQNu3QSEQ7Hi6irOLF3KWQdJE7Nxk6wT37NE74iOpIwRak6ujI9hV
	oyRCcLoqd0fN7wZOrM24fmC6ieWFwMEWmhQ9cXCU+J+aHAn0QdKFsOqs1FYZIMyaSZARre6tW8C/K
	rl0XSUtyBXzBeVhxCqOXsbNc9tgSKBOOF1kUGYGqcNcVE23o1Uz2v+JUjcuM+TY+sHgpubVSMcyaf
	eWKXny57qp732kz7SZ1KqG7gNDZaXGbiAPgOfUzP5VocVVj20EFqQi0ChTomPU/nqfmNZal4Yo3d4
	ndKoaGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TAb-00000006j1H-3ypF;
	Tue, 15 Sep 2026 13:25:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TAY-00000006j09-1EZG;
	Tue, 15 Sep 2026 13:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789478751;
	bh=n+xfkg7b6cBRQFcEcl4DQNh7KCXdlVfEV7dSl1CI46g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HLzK5T+PL7+QNdbur9YPOrEAL2xCzL2s/cGPigZPIhmJuIhlSN1NWe4RggLgBfLX2
	 ti8SoOcuFR6yA66H+oJZv8f9r4tfsZK3N3QPWbeubsfkCsAY7NpWZBnbRwCoCRTRzb
	 bw5oHpgYjS6Z2Us+4Ha7n+vVXFM1SrhzBQy+syp1Xt9Ur1GFITkePWBbRC41o9BJVx
	 lQFynk0uQxxLQsTbChs2TuooLRjgpYxq/AMtYqKrsWm76YkpcvosIoVQvvO8yxdTFl
	 NzkgUeV476tlyNHkdr5F1DPG2hANy6sf4zDr6twX5rjk4aB6FjLVTEvhCu6rrHOy4c
	 DDjkNKNJYdSXw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BB6117E07A9;
	Tue, 15 Sep 2026 15:25:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Martino Dell'Ambrogio <tillo@tillo.ch>
Cc: linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kees@kernel.org, tony.luck@intel.com, 
 gpiccoli@igalia.com
In-Reply-To: <20260915141226.600486-1-tillo@tillo.ch>
References: <20260915141226.600486-1-tillo@tillo.ch>
Subject: Re: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add
 ramoops region
Message-Id: <178947875151.35150.1801064329287090544.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:25:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_062555_425816_17C45908 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On Tue, 15 Sep 2026 14:12:26 +0200, Martino Dell'Ambrogio wrote:
> Reserve 64 KiB of RAM just below the ARM Trusted Firmware secmon region
> (0x42ff0000-0x43000000) for persistent kernel log storage via pstore/ramoops,
> allowing post-panic console output and oops dumps to be recovered after a
> warm reset. Without it, kernel crash logs on this board are lost when the
> SoC reboots.
> 
> The zone sizes (record-size=8 KiB, console-size=32 KiB, ftrace-size=8 KiB,
> pmsg-size=8 KiB) consume the full 64 KiB carve-out. The requested ecc-size=16
> reserves a small Reed-Solomon parity block from each zone's own allocation
> in persistent_ram_new(), which lets pstore recover dumps even when the panic
> path truncates writes mid-record.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
      commit: 5b748eb481caf88e7f0b3c763dbc6247a59f6e21

Cheers,
Angelo



