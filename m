Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72ADCA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsQ6WpVz6dLVvH0jIBhmi25p6i3B1TGiyxsQ84fsA2k=; b=1uvaWjKLYIh722z6JLhnTKhyA5
	s9bIsdd9oP7276JbdPuXCp6LvF2hMSH8NWtpOlo7oPGMbqgip8pYA35meHM1B+Y8r9v+UTtxICg1Y
	wKcbe5PB8KJeYYAUmIDzGiel/RHpfmGyjAD9PQClGk0ZPNkIGDUi0s5K8u/zqBTyfytJzo+wW2Fv1
	NbvxJn6cbO94ULCmGRyFMMB3MlWHCrD8iYkKymWU2c8oEttMkaGncy3KcT+wdAG6JPFLfFKSQS39J
	7eA+Ez/G+on097qsAK8xh7gbl8EXG4m6eoK7JKLIhU2Cyw49kBs/kACXuUwFgHLbcPfHO4AavVKsI
	jyn2DyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmZ0-0000000Gvd4-28xN;
	Mon, 05 Oct 2026 17:33:22 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmYw-0000000GvZT-1Alq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221594; bh=xsQ6WpVz6dLVvH0jIBhmi25p6i3B1TGiyxsQ84fsA2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CeAP4R2E+XGddrFL1NvuJHfcJWjHGcURzRmVMHnx1+ikAWi/4ETYPUn5K6RUoPY8Y
	 yNRscYJIFwalq2FsaiFJiAet1dJr1gUSxV9EgxFF9O9Oki/zve9JNtvukZAwi6FgDw
	 LG1avGynscl1CpT+QPnCl22GaFj412v43oY+ReHM=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8493A252; Tue, 06 Oct 2026 01:33:09 +0800
X-QQ-mid: xmsmtpt1791221591tnj7j1o1a
Message-ID: <tencent_0512BDFB22810AB03126E3189320800AF607@qq.com>
X-QQ-XMAILINFO: NxKoLLhE22aT9FMcDdKuxzg/LrQ63U5kQq/Wfq2X6KO052ezmQI437CjloEi1F
	 Whn3Aeeoq9TlAeic7f8ZMRhssaqnnlNNkse++sQTmg63RW5uKrGwstlylr/qBUVq73AzG7T4kmsQ
	 i4S8gGMWj4u3Lo990yvMerEmvKfHpJQCtoHLxKiVjOF4KT8LygLFLd9ph23SR0fC3w0Ef9fUMn+n
	 NKMFwEWqoKAM8NZQMWAxWUzFPyAtqCgM2MalUG+m/E8vV4rxCnEhijOEU+DiQFJ+rm1l10n1w+xj
	 v/3TNFh6msls33xPQvgaFHMyz0jyG3vYdxzae3+sLOScjD6om1CfrM5KQqHMr5hYx7K2UPNEmRJF
	 g1xWspC24wK+aF7SHb/jy2kzr/imjb3mhWn90wvrXDsheLwoZoAG1YQtLTnWd6daeUIjN1XmQtiw
	 qGT7ZTuBFAYCs5Qgqikupdi3DyYyqInCUX4HTCTeYpmWwJI2DClvuMzU7eU2Q3BY8kwNHi1uNs3Z
	 fjWkyegvUsRd0nVXH/d7jsX07GDG+ui/hBbxXsIoGEE8AL81qDuEuL1YHOTkZaSnvsqh2gUqJI4J
	 Ls+f9XeiXF3DJxRKz2BaBkcaMY+czbv9wB4tPbiB6GzWEkhlHjsLfPQAVj7KO9PyoUyGzeJsKI86
	 B/evtg5MIp8Qscoo1+7Wj8mRQhzu5RfJDLNy2jLlXc0EMWBOzgcuGSmKDEI2r2KFbpCycJSJHUn0
	 hmMNKXq2B6HERxiW2F7rIEYrSDZxwasv1RU97NUYcDjGlIKasGAAReGve+/AbPLDmVfyzDi5AfE/
	 H0qWoH3KyK0GIw3BLbED5PDnt6/xYPffH2cyufGBKPg61yh7QvWYCSDRV2FTOqbLJkC9agBsqcmW
	 /90NBhEQQ8Owe4v09l3gu/0EGIk9M/dLfHqFmcODKqTNrIdO3G0Z7gCL0y48V4mQCwTmbm4GFb0Y
	 TLioPO/tw3mjI+EnCtyRgDcsvEoehVuQjpxcXZX+MEfLy56rcN+fQtzIC3OTj/9PCNIre039iVy4
	 pEA6nJ1ilmvMgWS53rNBEPiFPtXWU8j/S0MYrDb9z3owZnctrGL8A8TCArc2WKHY3XiKl77gITQO
	 5t6XshOMmTRyFbvKlPwCWw/f8JaqRoyGaV2MsAD88730pQAXYz9m+BdW6JG+bh9T/9btqy
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor prefix
Date: Tue,  6 Oct 2026 01:33:06 +0800
X-OQ-MSGID: <20261005173308.710986-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173308.710986-1-2254650260@qq.com>
References: <20261005173308.710986-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_103318_867266_7CC82E26 
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

Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
Co., Ltd.).

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..97e7ef340 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -90,6 +90,8 @@ patternProperties:
     description: AlgolTek, Inc.
   "^alientek,.*":
     description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
+  "^alinx,.*":
+    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":
-- 
2.55.0


