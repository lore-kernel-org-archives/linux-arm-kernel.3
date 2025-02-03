Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D612EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sc7kPVACZJmkadeTt4fOjS6k2zHFGu0MilDaurykdoQ=; b=wVbsK+a6Wxknyg8GOTI8HAclOI
	jsR9aPdjDWL16YgAjkKQa3xbYM+XTNWxTjpCkMNGymTjycWJpwVacq4nCZ6H5CCw7axoZbgvUggA3
	Fv8w2SwOSk5vzfFslGp06T0Wx4GD62LRB+Vi2mXbv+GNzrjf2lscZmWfUgV+wzOYCNpoUX82/dwwD
	v+yUmAkCFDGlXJt2Q8hoLMl2FuRniMz/LUlMOXWcF4H+efduvu/uu+SY+uDeZMr5PmBS8ELytYDiC
	0mnunJJOY9eWY2dqOWLxVQfi4OYByYyiS7iV41GDGyVZ4ru/Cnc+x7UAvihkAxabYMZHFTikSn3qz
	aBSe7MDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf43F-0000000Gfie-1VVM;
	Mon, 03 Feb 2025 21:32:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf40d-0000000GfBe-3xvn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 21:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 857045C6962;
	Mon,  3 Feb 2025 21:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E5BC4CEE3;
	Mon,  3 Feb 2025 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618175;
	bh=BebvpPREciDqkWSJZ64d5uD1fgdX0OpQuYFwZj5JRgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eEm1LcU+ACo0yxGrYyt9C4HmP7/4/Qh0O04OBFHKGwkjI+smn3Lb30EyoZOu9yKzj
	 X1pqMpJh/jkO8zqibLiS5IUnsHB1LklGpH2CWQ8o39gqGkdTrkhNzZaLeWKY3OE1m3
	 691eCwS69+ZYI5WJsU/YmKpSzWT+432adlTzm3dcEyq6xxBEM17h9qBMbQmBd+nZYe
	 N3wDwZt7iZW89jIBGlvwHfnEIpmo4O8bFSCG0UlEUpTNwpVAZP4uOxSIIhOG9iPtDv
	 yP2/XI2mq46aBhDacgiJW4O7tirUECBA2Y/6YIHgPSLbSD5ZJ0JMAoZqzj/P4FNRta
	 ZqSUpng4m16FQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 03 Feb 2025 15:29:13 -0600
Subject: [PATCH 1/4] dt-bindings: memory-controllers: Move qcom,ebi2 from
 bindings/bus/
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-dt-lan9115-fix-v1-1-eb35389a7365@kernel.org>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
In-Reply-To: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_132936_032216_625C6DA0 
X-CRM114-Status: UNSURE (   9.74  )
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

The preferred location for external parallel/memory buses is in
memory-controllers. 'bus' is generally for internal chip buses.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/{bus => memory-controllers}/qcom,ebi2.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/qcom,ebi2.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/bus/qcom,ebi2.yaml
rename to Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
index 1b1fb3538e6e..c782bfd7af92 100644
--- a/Documentation/devicetree/bindings/bus/qcom,ebi2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/bus/qcom,ebi2.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/qcom,ebi2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm External Bus Interface 2 (EBI2)

-- 
2.47.2


