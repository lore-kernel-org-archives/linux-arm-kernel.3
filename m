Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77635CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0b6nYcdg7hiAcKdA4JhGlxHiilGQ3K7Dert+al7aoA=; b=sx9ncEewMhilZwLSOIW6JgfHmB
	jNC7K/zmveq6QcA/s9AYgTgFm8J55MaPn98QjzpeD0PvvqdMtbcydlzfjAOHDIxDZKQszxJ4VKxE5
	LOpDdOanW0jnEJb+xS95FFydPCf2ftJl2qOveZu8b96P1dw29w2rChIRw0agFIsKAY0JFWcotb/NM
	7B00Za0za+O0z1VefKsFNMVoO2APTfXMn8PVUSpVCfuZGod4DyL5ch/PZaV9Ks7UCN9mi7xA9Z9ir
	KiUtOXAzBGOunStkI+aLsnMfhdsdRCNhd8dy/dV6SkIsRfBhuGKs9gW2fIiUExOLEisVJyvGNeUYb
	IgZS2SlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPN-0000000EjN7-3xYH;
	Thu, 06 Nov 2025 02:07:29 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPK-0000000EjGs-3g3l;
	Thu, 06 Nov 2025 02:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1762394810;
	bh=x0b6nYcdg7hiAcKdA4JhGlxHiilGQ3K7Dert+al7aoA=;
	h=From:To:Subject:Date:Message-Id;
	b=B1kxuvooB2GQMghXnBGjsUY0nM2kNBC6VAT7XUeXLGjGFv8I3THJNKkFd6jMVBj2v
	 4wiXOm2KR9GmWWX6cmZXw9teXpRioPjmrmDWNXjEepDP8BZvFaWxjvE4ranHaEXEyx
	 Y6G/5S98C//Tznwl9dSNk4Rw6wcR+VI3tdaPw8N8=
X-QQ-mid: esmtpgz15t1762394808tb962b6a1
X-QQ-Originating-IP: Kxt++LRpNywAhVRcx54Iw5qydXwjg4t+r/VQWDBNVZU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 10:06:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3992485569025743558
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 1/9] dt-bindings: ili9881c: Add compatible string for Wanchanglong w552946aaa
Date: Thu,  6 Nov 2025 10:06:24 +0800
Message-Id: <20251106020632.92-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OYPMZDjp99nuc/wUw2MdUSwpzyG4/mrfL/0v7O17UWEQtq6vNT81vMIG
	zuZLhWSFK8nSwjfqDwWyRYACQ1qqjB0pmwx2NzfvxuuB9KZCFkyupnNq53wtAl6zea0cTC5
	Nl+qSww2hhZporfG0iYXlbdmtOMYpk2GLLDAQd5G9h8zA9nAy9lu6oGb2WP6rVfQEPWI8mr
	nHWRgbZsezAuiel/k1VxmGDhGXLiOa+8BdMFLAwa4vHMyBOIXRP1FjNjvsu1snz/oqJzJCJ
	E1ZnxpTUcN+L6vXTTBljbkrrsITOZdFeKcLm0N1dpxVRHKcgSWmj7UOy6lijJ/1KivuNXQT
	Yj8hRnA3tcwynQgXD4ulRxnwf9md2hbEMf7UPLVewWOaxVS7x04Wp8oTTjZOOWELQG0vQ2U
	f1EyFXKl/1v7mquAGnagRv0gNOeSyat/JIS2o9MpBepMSnpVFKIpw6lhSSxqEt/o0JiSwXK
	5sQgSJUzi5tyA/kL+Umr1BmCSvpa6KkhFHoTwO8XQ/nGnJZCg9TJFVHJ9BdjgfJ8nCV2pKq
	eTkS4HrkNbimGUl8XZH4C6Sz+s1e/wvS5QXWXnPiY9o+Cc/01PoubsaFRzWo+E7L0b5zCKi
	4fOdbXVLQ1OR4zUwkL5YDhPlygfYyanvAbBZbMRfrIqMHHiOtsGoiKMXhTI3EB3ViY8KwlX
	ROfKRhIiZc5eWFD+KtmHejBlZXKtDTV9hpdcVojcgJrZMO9+a99CWY6+DDqZeKFZHmL1C7P
	TVN63/+zLjzVY2CIV+yL/g6y/IjYzGrNzz/oos27I8d1mvDxuAcTsNDbHmmAh62lGveHYSo
	UW7Pn9uBbH8nOU8WKDMr8BOdqLjeE79JTxMi3sBebZlUBr6gcvWULrGoTVt5iE+BNKF6FrY
	fsigN7Jrk0qLoV99BLRCW3fKX4cLqLF6eCAvxgybyZsYPkzbAyuKz4f78QAh1O8kxb6O1uE
	g7tdfXdCJjIROf3ZmqQ10XJ39qdUVokqjMbN6mxQzz0PnNVQYSubJOqdY+mnlladSNraHJv
	zwjx2WrWPrsS1QqI51iCtcsKCxatWcpeGcoziCZA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_180727_424750_EF7A796C 
X-CRM114-Status: UNSURE (   7.66  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Like w552946aba, w552946aaa uses the Ilitek ILI9881D controller chip,
and it supports up to 2 lanes.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index 434cc6af9c95..f331a47cc759 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -23,6 +23,7 @@ properties:
           - raspberrypi,dsi-7inch
           - startek,kd050hdfia020
           - tdo,tl050hdv35
+          - wanchanglong,w552946aaa
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
 
-- 
2.51.1


