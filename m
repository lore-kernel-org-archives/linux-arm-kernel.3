Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D5ACA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y8frYTgHxAqHZm9fAR9Hh7CDFzguBpEfPI7HBlluWls=; b=4x1bjTddr8R+Ym
	00tzsaU23qFfr8d6nNKFpBA/HeitCFPrAQvd7vEVbUL2JRDrQOEaW3DiCerIYpybob6E4S5tjsd50
	h/eOsKobqQ71/8Vln+cOFytdCOiwdCGVsrYVaGXmEVG7sNlEENvi310k9vy1HgFwfd1HGyUf9Rf3O
	Sendo7amFqx8O19S8d1Z1d9jugVgtU0l6uuznAw3Kf7kUpYJ2+OySH7bejNRGdIK2OhjixBd5wk4P
	0dxx+WOiCnzgEulcJiLV7hO5emGV51iZDkgFZzhn3jXr9zF5k1+7X+GJ68VfDQpiSQeDTWQJMYtv/
	5/W/4IeJoSH/bj0/GhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9g-00000006HXf-1B5A;
	Wed, 30 Sep 2026 14:19:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9X-00000006HSI-11kw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=y8frYTgHxAqHZm9fAR9Hh7CDFzguBpEfPI7HBlluWls=; b=mVTJKj1HKG7NWcKb8CfTWECiw/
	gjW/F75AtnbtwtNmTsCRmGKItXH7CrLSe84nSHH4hPd9qaMapouhPKxPZ0kE12G9xK2YAVbKrinmF
	IW06bLxkF1II9p2WwIrbIk4lpmEhqR9HqiDJbHsixfTo2ttjFMcF5DH2pvWxTTInWBjB1fpEayR4J
	ZRJMCpHXhIV4bu6fEChTM5rQv+xXu1crjWOerSZb8S0dWMrGGJd1NI8K8HAWtbFOktnUkMnJqcgm/
	sxZEL/fTUfZBWKK3oJ2cJvj1K+HdvLH+CqezxAuOXY2sMmNdXLWVVqL77shtbEd4X7a79AvXvhMKk
	XY5qSJeg==;
Received: from mail-francecentralazon11013027.outbound.protection.outlook.com ([40.107.162.27] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBv9T-00000003uZd-1Qx8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:19:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCKZ2MVdwqv1rWGa08mHKu4jz2owGG0dE7q//VSLAFxEmOz5YQw77tG7cqha/8jGqZ5g5L5/IWGoEDGWYHXI/5WGCajhTx8xWS1WhvI0X/V5gAYWqda54T2aAhece1wm08dRYSPzim/4fteDaFGAgS9ilCfcBME+ASGAAQCV2d/nrTUTQFMZnggPdaJf8Yu2GuSJ5hS+urqyN+l2MrskcuU4b4OXoZVtJVLYPZkWVb9qrjwQOXnrwKPwtvkMkuB81VgSuSb3Z+AH5i5yJfMnpC5y24Y9S53QOd76mkVhfkuWubYi0C0x2vXazDf8MIO6lYstcLGq67SljiWiTnBS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8frYTgHxAqHZm9fAR9Hh7CDFzguBpEfPI7HBlluWls=;
 b=lW7saCzmdZZK94BDo1+b4lbxDErphWrYYBKT+OykvnykQLTDfXzBKb20f58UiyoBLVYQELNMlB7B5rmYdZkZ0nnKcpkSAQb+wJmyG5uERnhWv/X2Nlmq/0M85EtLf1MkPqfm6yLCh9PGrUgxT3AgeRe5FrQuGCM8zBSolYu3aUnvx3S7VClCq/YOTMGtEAxlVz105k6xxc1BM7CM7tyi5iZsXo6fvL6Na6ZNmFBDBMHO9cnEuoqncWJ0h3fH/us2GPfCotENLl5L+Qqpgo5Nh8pWjngTkFMDBC7q6JlrEm1CL3byviryOPeJXBgmayEcT7iIXH15vL3L6By/ssO7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=baylibre.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8frYTgHxAqHZm9fAR9Hh7CDFzguBpEfPI7HBlluWls=;
 b=E0ngRwzMyAQ7BQZt2mra/iUiTS5fAblJ4lbLDjEF4D1bUAXwIHIGJnPsQAog3lIcio+F0VWDumiFf/uXB7wXFrrCMGC6uESKOlcdHuw9CARm0arRp63FlRq4xJa42yp0Zr2gL3siRxFRtEk6cBQ3dE67NXtW+c22Wf2sUSq0FLILdnKoSagMv7dIwXKOxz//KMjxdE58JJuOeR76TN4wCAE5nlHrPQ87dZO42sJA6u+LyRoTGz5gSFX2RD3j7kPDT4l4s8hhF0PfzCZw9jokRliTKxVNoxDzYYr17fRJX39foFVsDbYUGzQpRUNfulornety/o77sFn76iURgP1nsg==
Received: from DU7PR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::20) by PAWSPRMB0037.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:366::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 14:19:11 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::46) by DU7PR01CA0023.outlook.office365.com
 (2603:10a6:10:50f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 14:19:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:19:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:25:42 +0200
Received: from localhost (10.252.17.140) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:19:10 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [PATCH v3 00/15] iio: adc: stm32: add support for stm32mp23 and
 stm32mp25
Date: Wed, 30 Sep 2026 16:18:21 +0200
Message-ID: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC4avWoC/33N3QrCMAwF4FcZvbajTV1nvfI9xIsty1yF/bDUo
 Yy9u928URAhEA6cfJkF0+iJxTGZxUiTZ993MZhdIrApuitJX8UsQIFVTmtZVCg5tAbaATI5aQk
 F5gYOWeYqJ+LZMFLtHxt5vrwz38sbYVidtdF4Dv343H5Oeu394eMoiVSDJcIq7lPdM6ccUuxbs
 T6Y4IMA84OASOxtiUq7zORov4llWV60IscGBwEAAA==
X-Change-ID: 20260911-adc-stm32mp25-v1-2ac7328559d9
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Cheick Traore
	<cheick.traore-ext@st.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Cheick Traore
	<cheick.traore@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.17.140]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E4:EE_|PAWSPRMB0037:EE_
X-MS-Office365-Filtering-Correlation-Id: 811ec305-57cb-4315-b522-08df1efdcc0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|7416014|1800799024|82310400026|376014|260925021311599003|260925021911599003|260925022911599003|10067099003|56012099006|6133799003|11063799006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: Dw++E4hbaL0EbRh1S/MDs18F37DkcPm021BDJjxZ6pHq8q6h9n0ca4B6ZT0xmDq596Xt2Y0MPeGbEiNxbVwfHVDZP2TyiXHBk4SjxuuqxKriQgJZ8YVIUz5L/e7tR0YINHBko7Yehx7c9U12WqfvB2QCQOFaWoGjgMwJYVbJ5bPbyFV1WmbjGy9uxV3ylyU+UeCvu1M4fkEE0qinIN9TeJlUU1Y/QBupRBXE1g2w1DQLnxoJphV0areiknUUzYlv9QBT5g8Dyy16Z+nlNlHeU4akwlW4dYIX6r14ciS89+UktRCLbWxaMsUc+hv8/oHV5vCIkQXRFfynbuxEMASSoRGhiIHel3xaZyLbqYFcCs70X4lqaqtlHXuIIbKBAyJc+MhSvMnL66ZiFOG84aQD2J7d5vXKW0agMkHyElmJLtfED+47cngyqZ2gUfGQl7ISDSxgKl220gx0l7WH8PkKrGjT47mZDshlzUgj9+5rpGbjp8016EEtZwqFTeXBLcmNPkW4t2nycbhtkbJpLHWt2ACX3wW/7Wb+P7e0AsivWCE1PKNAbtkLJTZ3Dq2Fcl5i3Ex5Mq6ry7MtFWxvbSE6W2ZpDhRaW654wXTdWAmrxT1RW96WYtEuvgqWubmencikZ8vV79DD2x46n27QjlJFQA==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(1800799024)(82310400026)(376014)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8sFq5x0NECsMizU+1puIzAtFnR/tcZWZhnJBXbXev/sEKo/z7kVuFetgs3L7hc9ccPuz1tClA7nlyMfPVjg8l9PTSWBid7HUXaH/9T/OnzAxZ9nFTQv/Ndim7BFNMtdjDJwqpcpwP0rBPYHzHb6E+9UqP4Nnxy0kGyVRGjHmC7G7xX8EJJWNRgF5X0sgoIiXJF6IsA6J57Bk390sw9WaY+kNWl4mJIIQxnqJGLA2eDeEGRGrTxlbdJ40Qyms0UQMDp10DT6SgLPgDY5Rf3+YkiWTWNGzfEt6UcSf1HkyBj2uas2vbQg4KMERmIh0Yev90boJmLqgViaCJykjRS1iaOVMa4IfNGP9TUvCLeFvVtIntkUjN3RBD0mF3cJpL9DfUEE7rJ6C+NG2aYP61JuAmlism+Wp9pFheQXzW8IbpOd/N96ejZpJCcR/2abuDZ2M
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:19:10.7708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811ec305-57cb-4315-b522-08df1efdcc0c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWSPRMB0037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_151920_190395_EDBC80D5 
X-CRM114-Status: GOOD (  11.97  )
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

Add support for STM32MP23 and STM32MP25 Analog to Digital Converter.
It's a variant of other supported STM32MP ADCs. Add the DT bindings,
driver, SOC DTS and an example on stm32mp257f-ev1 board.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v3:
- Refactor the calibration routines since Andy comments
- Style cleanup since Andy comments (added one precursor patch)
- Adopt field_prep as advised by Jonathan on patch 2
- Rebased on additional fix that has been applied separately
  ("iio: adc: stm32: fix minimum sampling time values")
- Link to v2: https://patch.msgid.link/20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com

Changes in v2:
- dt-bindings: updates since discussion with Jonathan. Drop fallback
  compatible and "st,adc-trigger-sel".
- driver: address Jonathan and Andy comments and overall:
  - Split into several pieces to prepare the infrastructure without
    functional change
  - Add stm32mp23/25 support
  - Then add vddgpu feature.
- Rebased on top of fixes sent separately, since pre-existing issues have
  been reported by Sashiko on v1.
  https://patch.msgid.link/20260916-adc-fix-intchan-v1-v3-1-b5f05b86bc60@foss.st.com
  https://patch.msgid.link/20260916-adc-fix-div0-v3-1-bedf027a6e7e@foss.st.com
- Link to v1: https://patch.msgid.link/20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com

---
Cheick Traore (1):
      arm64: dts: st: add ADC nodes on stm32mp231

Fabrice Gasnier (11):
      dt-bindings: iio: adc: stm32-adc: add support for stm32mp23 and stm32mp25
      iio: adc: stm32-adc: core: manage clock prescaler diversity
      iio: adc: stm32-adc: core: configurable number of interrupts
      iio: adc: stm32-adc: rework internal channels data
      iio: adc: stm32-adc: add vreg enable option to manage diversity
      iio: adc: stm32-adc: preferred style cleanup
      iio: adc: stm32-adc: add support for stm32mp25
      iio: adc: stm32-adc: add support for stm32mp23
      iio: adc: stm32-adc: add support for vddgpu on stm32mp23 and stm32mp25
      arm64: dts: st: add ADC nodes on stm32mp251
      arm64: dts: st: add ADC support on stm32mp257f-ev1 board

Olivier Moysan (1):
      iio: adc: stm32-adc: manage characterization voltage diversity

Patrice Chotard (2):
      arm64: dts: st: add vrefint calibration on stm32mp23
      arm64: dts: st: add vrefint calibration on stm32mp25

 .../devicetree/bindings/iio/adc/st,stm32-adc.yaml  |  71 +++
 arch/arm64/boot/dts/st/stm32mp231.dtsi             | 116 ++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             | 116 ++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  22 +
 drivers/iio/adc/stm32-adc-core.c                   | 104 ++--
 drivers/iio/adc/stm32-adc-core.h                   |  21 +
 drivers/iio/adc/stm32-adc.c                        | 597 ++++++++++++++++++++-
 7 files changed, 987 insertions(+), 60 deletions(-)
---
base-commit: 7b05d04fbd3e7aa3380767122eba0b3df2882ede
change-id: 20260911-adc-stm32mp25-v1-2ac7328559d9

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>


