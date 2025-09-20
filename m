Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7D9CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 00:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WPYi7sPUqVQFwd5DMYfPao/LFjtl0ygD3emLcV+vfcY=; b=oEmKSWv53QsbdQuTDXmx9RK+z9
	+yxiVYB+jnmIOJ2KngoJIDsMlFN9+YlzPf6scIuayHw8Jjhxb25Tpdvzh3GZ1KNwJ03TKS1xTADIA
	pGuD3QvBzxTEX/12mclnYNsuVoPRVMjC9QQBj6Q4vVoeya6I0LAfsLFV3jMB8PY3tPF91T5ddEeV+
	4v1P4DJ6ovdzQDQ2OkMY/qehJh7UkuMqR2A9mDwcEsF5RmCAf6ZkzyqC2AGdxmmZJkwqudehoKpAK
	urV9xoDQOk1B6m+p7szaQI6Xto/IwUYF/k1IKX4p/vnhsukZXu23L8bTvEy0y5reaMUfaBM16+MDn
	LtHc82Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzl7a-00000004N3Y-3yuW;
	Sat, 20 Sep 2025 00:06:34 +0000
Received: from p-west2-cluster6-host8-snip4-10.eps.apple.com ([57.103.70.63] helo=outbound.mr.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzl7T-00000004Mwn-3AYw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 00:06:29 +0000
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with UTF8SMTPS id 6D62F1800261;
	Sat, 20 Sep 2025 00:06:19 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=WPYi7sPUqVQFwd5DMYfPao/LFjtl0ygD3emLcV+vfcY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=31WZ8LclWRDTQbGP+SnrG8FWeDlYT314juO9n7NlUTICKFSF1iou+wybdwGtXSSgWvuvK4+ccEULhMxK/dESR05T0NxBBAH9DTw9jWgdMLifbKV1KQBNobIezSXka9q/kmun71XvI+7qewOhZyarj7GIMnGLQt21pWPSo89EVuvvV+SGjM8UAauHgm2pPuAeYX5i0e3hnBOBtdUvGm5vA9dCfDew8MCuRftl3pcbE99smSnS7tlC28DJnEAgHHw6p+8T+pTS73HjUDK89LST4eAKZTdHR9vjYEaTuJnpCouMr+QaFaNAT2Y7LIDU10N0rDkmajs6eRoHkym4qzhr6Q==
mail-alias-created-date: 1643268037438
Received: from localhost (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-1 (Postfix) with UTF8SMTPSA id DFA08180046D;
	Sat, 20 Sep 2025 00:06:17 +0000 (UTC)
From: bryan@bryanhinton.com
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	Bryan Hinton <bryan@bryanhinton.com>
Subject: [PATCH 0/2] arm64: dts: mt7981/openwrt-one: UART labels and console
Date: Fri, 19 Sep 2025 19:06:10 -0500
Message-ID: <20250920000619.2643457-1-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rsqgtyyh4u-4dZ8sjJBoZ70CBEvyscKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDIyNyBTYWx0ZWRfX3tIQfDR3WuRB
 bhFGXsN9wpKlpFnrckty3RrHeUbKv3zAbob8yligrbCUvujw5m6hBh+mCg1KwV6E5xql5KkjI6X
 FOc6qLuC+YYMJvzaA7Siej+kPY4467e5reqlzDTbARJSSordIk/Wn7RkPRbt7iliH913OJCGF4v
 QJWy49fHg9iBtFUxuLOZzcHPkSpThomh6B0/I2gc1DlnAgUX5r2mjY/JIawml7HKjG+5NW9BiwA
 O4j84LgVTrBCmoPkedsWUbhs6Erkgd2507DvWKhUbmdgNUx7geCK9LzTefxy8n8LcXeaELdLY=
X-Proofpoint-ORIG-GUID: rsqgtyyh4u-4dZ8sjJBoZ70CBEvyscKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1030 mlxlogscore=925
 phishscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509190227
X-JNJ: AAAAAAABdudQAZpeYxNdutgiEj3zy33HQm+50+3JdYmE2ZrCz7B4y4xTkv10BO4Q3ATHDEjekSEIUBOiv4o+CpMOXQ8jTB59D44gxyo+H3azDRf1udINOSLSHuwoJmM9pxuvUNVXk6fBeT5Vs/0mih35Wi9j7nAgcAOKMShemCfkC3Kd76QVnHViYVgz8V89uQDIPX0476332OmqGC5GL3G0rqj5RMiDJdSwyd6+CpRcq64Rxzcj0tcN7bXmjC2OfdwswrpmCmF9sCzbCH1eIS8X8nHSQQfz8c4Ny1VnZzsyWOfVtuZP6SY5+o78WxkQt7yW3OKOv7di9x7cz0CXP91uAI7eVQlvSUp9tMd6OsBIyUpBGDxRfvmYYPgLavhu1Ko7oQw+YJYrtspNjEujKZ6naWtS1srdzKWbguROwshxyRfDEbaDL4WFtuhLosZNZ9Se3HdjL1+gs056nlKuhEUJ38+Hyy3wWEtARRbRxqKUZe7H9zQUBl0TczivAXLZ9bycKrGZQsdrPWPY3y78T02WZwlhpttaxCfL7qFmIxcdMHbE8S1lM1rbIIRhRc4BXbRJKIxgTCNbDWYticXv/xVGXGcBkbqhaaFcNJ1P9BzcDtl/kpd5uH1pldsLG8ghVIcmjZlH+bkYB0z7l4oS3v3Rzw7lVo3XV3lYGKyXmsktnEnR74lh5REPV1zmjq0q/FMpG/EkRoNWmbH8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_170627_796726_194DAB10 
X-CRM114-Status: UNSURE (   7.47  )
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

Thanks,
Bryan

---

Bryan Hinton (2):
  arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
  arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200

 .../arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 13 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi           |  6 +++---
 2 files changed, 16 insertions(+), 3 deletions(-)


base-commit: 1522b530ac3e2dadd75ccb351b88d3c7c4cf584e
-- 
2.51.0


