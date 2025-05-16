Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878D5C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 01:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O4z6N/dwihw94Yux16I4zQxNRUaK+ZyOnLM4Ze+b+xg=; b=j7Rb/egLjxvlvOBBhGvqmNNSis
	hHKaHU+INOfYeRUTcyTcrrZoUsXhE0d5uzaLmh77gVU4j1T72FxkpKH9WKaQMBc2NLxiySZU9t6DP
	aAL6/MzOsCaodXuGyvD6EIRIFhbF+SzpU0yRv84Sk1xdn8QVB+Fa8x9wCSzXbDOgGjNd3uxGBy+dI
	w8KGT87my9vcjsK0ARGpMj5/egzxDmNUctb4PQ8JSARezN4+Mvgw8x1ZzKyJV+RNiTCiUmPZxK7e7
	fB1TOkmWdWlQos5OChpP+C616rV9PyxpTxCe9isGeEq7Tiz8CK468qv4//osX5Jmv9nLXW28gAzwD
	Omks7pPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjrB-00000002CgX-3V4c;
	Fri, 16 May 2025 01:27:25 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjp1-00000002CQR-3ZOF;
	Fri, 16 May 2025 01:25:14 +0000
X-QQ-mid: zesmtpgz7t1747358646tf895317c
X-QQ-Originating-IP: S86Fui8y2624yiQ2yyHngT1PUpbtPOcRCOPIdeWMnsE=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 16 May 2025 09:24:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14660113273428683281
EX-QQ-RecipientCnt: 10
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org
Cc: i@chainsx.cn,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Fri, 16 May 2025 09:24:00 +0800
Message-Id: <20250516012402.580468-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Mutteg8H72qDPCJ40a+mwzdvrN+3IMOubGL6Ovp/EmyTyl4iTm8gdc40
	TdZ5qiL5fGUKkLxRgNvpXv5rKx4XdREZHslc37vMVk0YTWmj06bCRDRPFaSoNHAlhaLM2ZP
	hKpUrBQjCXg3rfdob4srIvYUoRtIELfSQS+nY4R5c/AGiu8xLnEzJ82LZ+T+0b0HTh3Wom7
	tRgBh3uPAe0o3TTpnnUeIoYY+E18X1oghe2pc53GaJTJNXdCEzhMMzaSef5b/ajacdrI5df
	ZbsWNyN1mK4zA3jqwqwI29cGpGxrSp4pLj0LeCM6RScX00YjW4WngLXEl0zEeA3M09DdH2x
	xyaLoEzMzb1ijfdAxLtXfGBIBF6KDDR8StU+WRSKjprTsh+EQIgzzTiI5n0VfYOkp7EYiPH
	j5joo5k6l2hPwbigBhSUgJiUErbpzssSyK7RzMNbdORINmiTum35Q8MlclyO/HGXOEKSt4O
	YZw3xLUiMVrVO03lzFGiC1JsQT2851qjw0PiU0ZTfwksxLzHlRmKXGwlakZ2JprjlVdErpg
	lQ8UB9X8eGikO0rTW8j2lExUAOFb+PbFZPxs1ym+PFuksLP5VyoxJbFMsmZV/1Zz/1ZSAX8
	EWUm9OnWlL69jtZlBYV2pOvouKIBu37so3XHQ8PR0qs1tpcSLqwTw/8sNKQwIsOtumR9skD
	ZePggG7u90W/YfzyqfqRwvwrVxozU5NOCvUWepVB8afMMudJc6Zry4kQEEwNdeZN/lq6Bo2
	Qgz4NxlBn710hEPHLUlLN+kq5zv6kMArYrdwIKyTasdy7dVVcv2SCZ6Vty+pt4yM48Rdk6a
	Drwlv4+8+D7x/c5HdFdQ8AkhSdYvKhw+ysesTtzJZrN8NvCyaTSVTIBqKf+SFp6Zb7estGm
	xvU+49RZtbBZsHBxCr81S4bw/djY/5B6v3lqIVl/b7GpjmCPnk2aPHXl9KPEVeVrOAL5X84
	Uvz8O4GGu+uGJ1QtRvXF3Gvka53uJ68HCv8NSMlYZShtxFgXiHJgvORmjW7nOu9hKRg8=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_182512_501004_1C069262 
X-CRM114-Status: GOOD (  11.08  )
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

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v3:
- Update the name of leds
- Add more cpu nodes
- Update mdio compatible
- Fix the order in the node
- Add the default serial port(uart2)

Changes in v2:
- Fix rgmii delays

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 926 ++++++++++++++++++
 3 files changed, 932 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1


