Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7270CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 19:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EXH2uzOsYXEb/OZo3TWC/EXROKtOKzc0Az2pObM5tZE=; b=3AUMUmip8Dp4Li5zjDQVY1XR5W
	muimW0pmvKJ6AGVhPYtNaVZwksjGWumevVQpi7vyJkVIslMZLRrn57HJGDM9zJIbGNwfbgviKLHCi
	FhbhmOhvRjI/PuppvV75YoPIcKXdhTunIJY+uKpK1mVkzxzQq8w6u4LEUffwIsEdyvLweu9KK8ygY
	xMJ0oApk9jL36FXB8Yy0u8k9eQgnrNFDW79UqFu5ppZy9fiAZ1UYzxNzIJqGlbNRGW/hhEJWvYUcc
	QQU2Anv+MI9uAi+FlrGjB63hBQIwUritO+7M8jgE5wruJOvVpbQQFxgbEmDvcH/FlnLj2RzKT9/fW
	Eh4wtzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03d7-00000005pkt-0d8C;
	Sat, 20 Sep 2025 19:52:21 +0000
Received: from p-west2-cluster4-host7-snip4-6.eps.apple.com ([57.103.69.217] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03d5-00000005pkA-1KOa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 19:52:20 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-1 (Postfix) with UTF8SMTPS id A6B121806677;
	Sat, 20 Sep 2025 19:52:13 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=EXH2uzOsYXEb/OZo3TWC/EXROKtOKzc0Az2pObM5tZE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=JH20zbhuvH3+lZmfx5i5GM42mEK6KZEZhCcJfFVfdLpoIy3uGdod+WIr1lFDNA3aHA3peu7Oet7aIiD3Nptqs1Yd6lhMrvjxQ1pSml8AyjQnfYMh1/SuyM52hnIjjwJqCmliEwLd3HtGas35vYqK9QCQWztgDXSlmKmHO0OKFAXerWYZaUYmluJlYGN9KyHVjxuYrLO4cVdo2hq+ySr17chrcPYwJHqoiflP4FgZuNMlyg9bID15GmStOjXFuqkOrHto3MuxUHMzWXQkyWCBB7J3PRjVZBdlNf22O6A0hkHCIFFwWMFPsKptzhIqeS3YnEH8XLYZZPxv6If6V8Wmgg==
mail-alias-created-date: 1643268037438
Received: from localhost (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-1 (Postfix) with UTF8SMTPSA id B68D918012C8;
	Sat, 20 Sep 2025 19:52:12 +0000 (UTC)
From: Bryan Hinton <bryan@bryanhinton.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	daniel@makrotopia.org,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: [PATCH v2 0/2] arm64: dts: mt7981/openwrt-one: UART labels and console
Date: Sat, 20 Sep 2025 14:50:49 -0500
Message-ID: <20250920195102.2733949-1-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K2aGzzbemrEhCQMLHIN_3CskBEMNjXuE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDE5NCBTYWx0ZWRfX/tGkTmd8Pmsw
 Ra/N8lH8kZZf59fRYSssPgX7Q4DwpgGyfV+P7hdpq2ZJsBJosEZBGZai4duDup1Ll7uIj9IKwt4
 v3XwXd6bI5BRHnfhVgSvCn66rOfFZnkvredODjER5Je0X6YT6qdLa+SIFACZ9ku4QrObK0L9lLM
 NfIQA+ioH9zGgIcadv67dMnoazLeGwcN51gV4sGBv+HE3o+9xwy0YBLZ/E/ex7YTLQDD4H/fVy1
 mVhGkkM7U8O+4iEyUWSnuRdspOh0k2WBffSsjQHewPPpDTZmd3mztaa30hfzpgesqPpQau9mY=
X-Proofpoint-ORIG-GUID: K2aGzzbemrEhCQMLHIN_3CskBEMNjXuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=987
 clxscore=1030 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509200194
X-JNJ: AAAAAAABxnfy/qibpBMfdIii5yEhB9Xb/qWgxjXzVzMh2r7UF6jSgDVhRMc1bkaxeXwfMLaW2FsiQdAQ0PWZxLmnyQklXqLG4/Ni1917P7h+iEP10i4RtXRyH4x5dRSFUVHWhnNhuGIAquh/st21QZAwmIP1a1vrA3ji7jqJnlRnqzcuqU6iHZFV5vkYMRqn24i4kpG4Ps5YZJCp+/s7VBjEey9Ehu2ylQpgfwtyVX0uZEAq8Ygt3ddLYbsZn3SqTR4xRNvOM+lloTRMCCg7EpXv5rm62020OqREx84+cx2OLUW6m78k21RXvZ9HOunCNpyNusHwLkYJ9kXgP4MODpEVrbtV3MESGSy04LiujPQppzFIspfGhTrtqUsAp/6RGi8Wv31gtMK8Adqc12M+22EJAFY/HwKV9vu8rbhHM758ZQ8yfchbNfo3Ssy5fx9EV+VHbfnHFKS9jmyUkdAWY23rK/BNoniEeeEMuQD7ie9Ly0oJdRUrbvUCxkRo6+k5Gu/60x9rT1iJqgk9+I1QJrUvwjdw9S/ifKMTsjWILZPCTBcoIYO3egG/FIeKawWhWtZ48sMVcSxqBTXfHe5SDEkCFHMcAC2nHLxNyycrn1WGRKlsZPG094zgIonHJk/5OgcRrZ4GAa8sZ5omhHqJAtofpGUpUtddPmrH7GzubRWDkK9Iv3PMLg3/QJrpuKzSHMG+TO67l69JCCm7CHxb3UBx1/a6sYgtzcmvQo0K0w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_125219_361301_9609A14B 
X-CRM114-Status: UNSURE (   7.54  )
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

This series makes two small updates for MT7981:

- Patch 1/2: Add stable labels (uart0, uart1, uart2) in the SoC dtsi so
  that board dts files can reference them directly.
- Patch 2/2: Update the OpenWrt One board dts to define serial0 alias,
  configure chosen stdout-path, and set correct UART current-speed.

Both patches were build-tested (dtbs) and boot-tested: 
mainline Image+DTB built and loaded via U-Boot on MT7981 hardware,
with serial console output verified.

Changes in v2:
- Patch 1/2: Unchanged.
- Patch 2/2: Drop redundant hex comment per review feedback.

Thanks,
Bryan

---

Bryan Hinton (2):
  arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
  arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200

 .../arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 13 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi           |  6 +++---
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.51.0


