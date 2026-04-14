Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE76ED7B9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ToiL0nfFXeNTtllMSPT8ombniIvaY4M3+Mwkw7pu7bY=; b=GjGtlyXcmdcOTS
	epvq7AIJ74KCbCgP9WG0kgLxD6L6S69iGsYCoVztrtJwIzuQtdkju0PMiJx0gzanJK+DpjCWeyAi9
	VRQICoGj95FnrnyAdOKwwgF4CdZhFJVgP4LDMwkXGEYywIV8QrjYx6F60dniVaN+O2U49YUg9O4Wk
	5aJPvMwErJ31owkX56rNmkLwbzg/BLUnwF3AtsOn3Jg5314+IP0lO4aXPE2CIgb2L8+Bn5bATk/6U
	z2an9zUEfJcM9Q+AYOJj7EqNPKApx1xtwuD8QpacNu9097AGiuhjrSd8mhu2mkcU3o/5LPzBZb1Pt
	AYVHyBGqfNrgKTnlvMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5b-0000000H9Um-35xw;
	Tue, 14 Apr 2026 10:33:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5Z-0000000H9TJ-3J7C;
	Tue, 14 Apr 2026 10:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776162825;
	bh=peArRsgSCdj7tCOZzX4QtAqjUdjIstvhefAfXi/8La8=;
	h=From:Subject:Date:To:Cc:From;
	b=JO0JIPLxnzATb3XL7LLUAIMuCPWiB4uDlrtuMDy8pkPSk08izy7xNRM6+a1WDgBoF
	 Ff+48Qxg33kZg8++zzDQsy7hHMZsEfuAO7TvFkpmccR+Fvu/1ikEXWwFWToYFazr8p
	 PsObnyrPPbl5sY1ZnnG6WzcKvFd6xFOgr732TdqqnIop+1rVubZ5t1rrtSuPi7baeZ
	 QnaAc3KOCUYP8b9dBCDvX4Zhio6Ud3RtlO5ozS0d8K7TpmsGb2a8kru2OuOLR83zl4
	 6sSat6EgsCsrd72VY3qfu7OGh9zUtB8tHrG9QCqYgBp946p2oFg4Oq6Ajc4c6KfURa
	 g/gw16G01Ky2A==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A89717E0EB6;
	Tue, 14 Apr 2026 12:33:44 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Mediatek Genio 510/700-EVK: add CPU power supplies
Date: Tue, 14 Apr 2026 12:33:30 +0200
Message-Id: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NywqDMBBFf0Vm3YHEqin+SnER09EObWLMowjiv
 zfULs+Fe84OkQJThL7aIdCHIy+ugLxUYJ7azYT8KAy1qDvRyCva9MK5lQKVEGh8xpi9fxcFNlK
 rm+7GSaoWyt8Hmnj7ue/DyYHWXBLpHGHUkdAs1nLqK0dbwn9GwHAcX6sad3ecAAAA
X-Change-ID: 20260413-mtk-g510-700-cpu-supplies-41a78a6bf175
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776162824; l=1365;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=peArRsgSCdj7tCOZzX4QtAqjUdjIstvhefAfXi/8La8=;
 b=NXk+aPBqN3LNQq+MyWv/ARR7Zmgai7cJuc9VV97YVOvAoxADMXzwzGDLeyBqBj1iszsiacPFG
 dOyhAKK8+OVDKdRepioQuYsNVf6/XKPQKBty+njlyaNeyLYw7+rvZ8s
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_033350_008313_BD97CC2E 
X-CRM114-Status: UNSURE (   8.67  )
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

This series adds for the Mediatek Genio 510-EVK (MT8370) and 700-EVK
(MT8390) boards the CPU power supply definitions in their devicetree
that are missing for all their CPU cores.

On the boards, the big core power is supplied by a MT6319 (sub PMIC)
and little core power by a MT6365 (main PMIC).

Patch 1 adds the MT6319 PMIC support that was not yet enabled for these
boards.
Patch 2 adds the CPU power supplies definitions that are common to both
Genio 510 and 700 EVK boards, and patch 3 adds the Genio 700-EVK
specific ones.

The series has been tested on Genio 510-EVK board with a kernel based
on linux-next (tag: next-20260410).

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      arm64: dts: mediatek: mt8390-genio-common: add MT6319 PMIC support
      arm64: dts: mediatek: mt8390-genio-common: add CPU power supplies
      arm64: dts: mediatek: mt8390-genio-700-evk: add specific CPU power supplies

 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     |  7 +++
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 68 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)
---
base-commit: f244905cd8cff7a7249cd3dac8a366e02d61ad4f
change-id: 20260413-mtk-g510-700-cpu-supplies-41a78a6bf175

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


