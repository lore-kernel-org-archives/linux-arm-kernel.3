Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58DEC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hTC/OP0orcM6FbeOlNENWSTcaGgp3V5Z1uYO+r6tCk=; b=M4NEcdHO02ffwAG2X7SAm0TslH
	7kxxHPMsJxeXshM8ZAqxLAKA60ZR+xycd79NKPHUng2QnvM30qdEtD3Wobv5DNUqNxJssGtsoAITY
	gekiXbJ0q1grDc8HWmGzRRxNVcWch9YQaqX4V1YfoQ9tqew1RLABDcddnfo/W5rlgzjfH3yKfJECJ
	BdCAymgdcdGkPBH4RlN2iLL1KLP+6NBe4ex6oaLQsrXHMiAxqdgUXkfyi132bj2Z//n77ICYLVap7
	k6WFbZMqhEFA/vGBm1/3fk6XmBtMPlJh+xWju/pLXjFwCQz1/Zrfp3+dd2pukbCADB5f60rjAkWqi
	sTzodPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErdr-0000000Cnhx-35gU;
	Tue, 13 May 2025 15:34:03 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErbj-0000000CnMU-1OSo;
	Tue, 13 May 2025 15:31:54 +0000
X-QQ-mid: zesmtpgz3t1747150252ta77018ca
X-QQ-Originating-IP: k2CxpzjWGN6/WWuIXki92argMY1epzXrRZnzF/YHX2k=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.25])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 23:30:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8291567758837896463
EX-QQ-RecipientCnt: 11
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Tue, 13 May 2025 23:30:43 +0800
Message-Id: <20250513153044.167187-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513153044.167187-1-i@chainsx.cn>
References: <20250513153044.167187-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M4I3MZG5ZyeocokkyWY+7zWmtJOW2xErk1h+VXPGFqphUBArULTXtzLI
	eQHXrqYbHKKJs63Evzq1PiGaMQeesGPnjbN5Dd5ooepDJXEfmdvikeItUb2kSUt/Q2TwJ22
	FHlnXAvQl749HoRwr3LWT8YHVLx0T6qdVgj4SiWTfAfvzXzrfIWCH0vi7dKVQfjYJ11uiLB
	85krX2ObEZZ6fgzmM76a21QUkc9V1Oxyu7qjpZ8REDdsTJUHoC5+Uh7JQ1rYO0mcBW6bk/l
	H/XOGmkJEnFRQeN/FlwphW6yQ3YpvTcDmrHh+5k/0Dwpovolfmw/60fKLLEaYGlm7s/NFJQ
	QUKgfzDxOziVdkHo/5rDw+/Zl2ZcGx25OCTfeceGlsGIrv1PHHaatjrAzt+YNrvT3vkgISl
	+eHsHRvnkPQCXDZl4JSw77VlnsOFgeWh5pdHZ5Kzyv0HG0N594iMunOrR4rramP9DO9r+Y5
	8eKaWVGo7IWHbwMyyeofNoaABfFJ5lLl4gNK8BXWN/V88V8zhFErfyhsncCGPTRVWQgFdsA
	NExGgNDj4Y2bvyJ4znn6lYfhnJqrvV15MtJWgURptPsTLy3805vV0AN5Px6v1GyEVmOOeSK
	CCqlfR8ovWNoWoCmxXb+Pl4jrDMqD9tRGxoYXVJjhT4KUqT6zFGBfGVICql9V/wofb/cqOf
	gfS2leg6g77rOsX8TghWdn0zmJcZYXjAIrFflZDY8IXovFo10kpTXNdjXN1aSalMsSkPkYV
	CaU/H6wYYm8lDQMdci30/341TQbEvjxSYonDmDGr5j6pYZDYiy+UVJv1Y42pqzB/Y6UbcYY
	ahfnV0TddZlgWd72927BQ1X2tju1weymHQFAhD4BFmDa8tq/tvzRGFF1cXPbZ1L707ZsPoF
	fmghHX7m/y157YnhBRYEmZ2nKHu2u215GurUWeoBLoMAA62IUTb4uUriZHLt4GOUGQj1Oct
	5JuuH7IMQUla1qPvk6gztPUh2tZUNQsBUruvEhhXVPG//hQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_083151_795682_EAF15FEB 
X-CRM114-Status: UNSURE (   8.02  )
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

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <i@chainsx.cn>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..701d68aca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1


