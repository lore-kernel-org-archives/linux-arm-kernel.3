Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3154BCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wur1NLL6aiOKmJUmUiVG+uZqeCciMOf0+vtQvT0dX/Y=; b=PhR3cTAigL0M/7Idriiffgah7N
	p6wNLCQOv/1Jt/lJtXhNOjx2SCwfKpRJCtXakiALNIo4PRRAeYlKhdPJ4bPQmjgkoqHJOaNK3FUr5
	Nz4FPRSUkzm8DYIGEmfAnQIeVYojCsAPa+3b5eoilSCGGQjEhnv4TJTqI8XwRz2j/6SBGJKS0uUZh
	7d4ZNxXI0nPYdQkjFmhasVbLT94uMd4XI7VVyJjTmZxNybptXxOkE0y3wGhspF+FS2ppsT06LpV/o
	oYRDhb96/6R0Row1I5KBVzjgSjwhJYMOCQCKXpG+u1Xi1PZpuS+OTstEYV/BafzM4AQJYQUgLNrPc
	pdP2UPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmWa-0000000Gv7l-2ECb;
	Mon, 05 Oct 2026 17:30:52 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmWX-0000000Gv5l-2p0y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221445; bh=Wur1NLL6aiOKmJUmUiVG+uZqeCciMOf0+vtQvT0dX/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mardqgMsI6biMBS2wnKEZpDy4LiWIM9ZCS6I/RBSRczSZmCcUYOQGFr7cmw2TxMdt
	 oekh9Ru3dftx0vgupLxIJR63w0q9dRr0Iam75vDRHy34059QK4zs0zW40prHAJvDi/
	 fk2vuRV4iI046xOxbMHmVeLwvX2pezIXxJXRv6MQ=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7A82281B; Tue, 06 Oct 2026 01:30:40 +0800
X-QQ-mid: xmsmtpt1791221443th06dqgbu
Message-ID: <tencent_083C0104B06626D418A320F00AB992DD7B07@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XpybnuFTaIZm4mrEpr2c73AFdvMwVIo3lC4zNAU+ilEx13A1PAQ
	 N0vkhR5a4Q0H675Rh8Ar+HEWBXmfybqGyeAghMV6EtAEhUgFdEtnySAxLIlGOK80FJrKj1+jbEeW
	 uU8G5+P7nhuACRKpVemdSsV5OcCP8jkZrppqSY/kAmAPLC94gsy6KiuypZtlFmXbmdEKNwOosIyI
	 v3XTzIMdOGoqBGZtf0eFEo3wo2YztGGhVX8EpnwoI2ryiDHeawEZX7yuPgocwNyMUXDnwVSJ0Dt8
	 w2gFkc80HvxqrgzLqLjOsNgOniGiTRZwjohYL4aYIpFlDa7lKGV1lXJNsVqvivMmFwmldBRNFdTI
	 hqb6eFLWnv1WWRrDoH1G1HG4mV+XhxyvBRfozEYnbOaL58fo0RQD9i1W1m9hIeKIYUT+KRPVy4zM
	 rRG5PccMfMVPub2EmjvfBdKdl1WcWDLLwgFVERI8sOHYpnRgoW/CHOlXZz+jcQ5fSvWV5xrQatAT
	 Y/m1gCbcfZVs+acjb22oWMxlDc7u2o82zcKJRnNgTsb+TwjZg+PZeISv8DYolzP2Gv16RAt2onud
	 PjZysveZwyeDxEIGI3gHpr/+8bFdZoIS8bXDC4jDqyBQbonxJs3bCs6khg1001QB1w1HzRDcsuC3
	 owpsTqrCQ3xzhvu8GYi/LDN2slZp/6TP5vh4q5Aw6Vhk0FSxXxk4ByfdbRcdvQGSZsIbTdsTrvhY
	 L35SVyh0ksEq+0hRB1+EvWS96r/rUgke7uByySS9XS9Ra/1/nPPtfRxuKjGiS5OQwT7LeNc5Njh1
	 vMU2MbwqOmBeH8beoZVeo3/cOQrKYVWe2ccMaOPsGmBn5JN7eAgdlALpDubiFeVLN+wm9AwfK705
	 pXKjfuss1IfcjxYWd9zAtxFpps/Fx4byYy58RDteXXUowj1+DXIV6cE+EhL2FuBotc5w1f4XbH+j
	 kkmW5RVT40zQUR8SEHwwyZIHo/xitdDA8SxSU8XrELWhlyMiSoBflsqHqkpenikEDpqLtrxZTUQN
	 3UOchapfr3PClKeT+GJAky7WHItA/Bu5TdpxghciJPMkhA6UjTMmUA1rKD6Gzu0VmsHqF0pcUBmO
	 N53mBxiBgRfL4/BNjL5WXvrGGkVwzImgQU9qr2XGhu4Ygt7ec=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 2/3] dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
Date: Tue,  6 Oct 2026 01:30:38 +0800
X-OQ-MSGID: <20261005173039.707304-3-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173039.707304-1-2254650260@qq.com>
References: <20261005173039.707304-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_103050_056751_EECE8409 
X-CRM114-Status: UNSURE (   8.45  )
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

Document the ALINX EdgeBoard FZ3A compatible.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df..ad7c71f9b 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -46,6 +46,7 @@ properties:
 
       - items:
           - enum:
+              - alinx,edgeboard-fz3a
               - xlnx,zynqmp-zc1751
           - const: xlnx,zynqmp
 
-- 
2.55.0


