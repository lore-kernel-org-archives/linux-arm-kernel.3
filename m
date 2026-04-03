Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17915E85385
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CpqDk8t85d2FZ/scwPIoKaoNKKy95KGBBLBg6KWoXvk=; b=xGeZa+wSNbxJL1es3IXP8pweKe
	bztzLvUN534D+W7x5tfo5TidLZhEYN9pEjCbgV0M1SLEK6jl/XqiehVxzEL//lJXFS7X6N0Qqaq5d
	qnmdv8AWiG1YNpQ7JdlfVUdRZCIbb3HlS1T1RFBdsbWxBVoiF9XyPlEFOtIR4VOj/cWisL29lgXLq
	ljFwqzE1/z3RZAxdTajGE3XqgP6u7T+mGZHz+KsnzRbkolIJVHMe5VCvLObFz5RWcCidlbhZTIrba
	8S/k28EyWIMH3sVeEHTmRdRSkWPX2sEGGsRp+NGkz4eQKlWLI9NF21j1BidxlIZlPwvLwGn3kKQQh
	APtbvfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0e-00000002MoM-3xzP;
	Fri, 03 Apr 2026 17:08:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0b-00000002MlN-3dMu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FE3440277;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62892C4CEF7;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236116;
	bh=GlKYN/zZxt8aijzn4oIdQuv3Z0rJb0I1333hvIbLwMw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OZchdwm3Ry93yItR+6UNZXN34uWDQ7gZvJK2HAVZl/Qq2cvq9bdpSu34AsF1KWwXF
	 Ag7g7med83zCKIraZaGQUYsGmKxTCu1qs1L1zjKdmVQC7JjGbfvvaQm3v7LPD0ZKD3
	 BtE/fiACsNTQSmWksigJ/WblVyXNIFXqiDfngPflknrKnodGv87n6lrpX0aoHJtWvm
	 18JaTngPC0it1TbNBpTEPf2HKn6L+m732WFLUp98CNTLxoBhxXA57Tak+3AnxRZ4Zs
	 FmSkWC4cGAuLoAjrGtGwr0qWvIsqdVL1snlngdkepn6grRlYIJox6sU02kwyRyMNQl
	 mowISHbQyVFRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A577E85386;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH WIP v3 00/11] Input: support for STM FTS5
Date: Fri, 03 Apr 2026 19:08:29 +0200
Message-Id: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA30z2kC/02Muw7CIBSGX8WcWQwHSi9Orm5uDsahUGrPYGuAk
 GrTd5cwWMf/8n0LeOvIejjuFnA2kqdpTEHud2CGdnxYRl3KILgoucCC+fDsg1dMF5VE7HVXSQH
 p/XK2pzmbbnA9X+CeyoF8mNw72yPmKYskx58oIuNMCFOoWjetKesTzRQO5pMNUfxRqDZKJKri2
 tTS2kY1uFHrun4B4OVZ4dcAAAA=
X-Change-ID: 20260214-stmfts5-b47311fbd732
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GlKYN/zZxt8aijzn4oIdQuv3Z0rJb0I1333hvIbLwMw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QPbgkGGQZL6Ms1VT4v9eXov9xd9EfrPAqIV
 RcjKaBA9EKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 ciZGD/0VTy2p4LA7wUhf9zj4p6BQTIB91aIJN/nsxu35iLgxPUdqZqVKXN2OAOq5Jrr8g6LwlJ9
 B04oKF2XCz96GCSdXkC3FUo/Cxz5aeBx7+SQIXCXMYqilQnqhtSiRoog9DKTYyxWDsXBkOhsBCs
 UE3XebZX2Lcyh48cRBrGMEZ0NPsuesYofpsWmPGmRp6CRbnI+PhAgL+wk4vSxh+5kwPNvTUcNDQ
 tK6K4aYmPLoP/zxLyV5G2Lm+z6oFcq4quGWd4l1EbEZZLAavoWQuErfbyXXn9En5Xo8a1LEICFV
 WJ9Bb9R9pb5cclH4veK7RlM/mKrchaoqC+t07OtjNSfPjfO3pk+x8EGMDy8K+PyHjc3jU7s34C6
 mTBCYWtMnu4CuTLyEcuBPTPxuO09UC/4+Q6AnokmjduA555YQhOsEHD94qiF1nUYkO3hHmBUG2N
 D9cNOllkF5TlbkcexZcREw3MQP6NkoaIYx3sqG91GRJGGQbLJdAhViBB7PsZFPXdjnCjvLn3f6B
 C6fUx3jnH9Xe10yNcLSb94FApuY7dNvCBsfyYj/cN56C4y74wWvbQgtnXVw+Ur9CAnZPkLmVuDS
 O3aSmGOu/0CCBWEj8CWZMkWTAyOuncNtnXwtm7Lvq98ogYcwcKhC5IiYr0B+sNchfOmFYSkcTok
 UOK94K2QqppkkkQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100837_986635_5A808D3E 
X-CRM114-Status: GOOD (  11.40  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Used on various phones. Minimal basic support.

Includes device-tree enabling touchscreen on Pixel 3.

Sending as WIP, as not all comments we're addressed, but please feel
free to apply any patch which does look ready for inclusion.

What is missing:
 - switching between AP and SLPI mode (to be able to wake up phone by touch)
 - firmware loading
 - anything above basic touch

Signed-off-by: David Heidelberg <david@ixit.cz>
---
TODO for v4:
- wrap everything below enabling the supplies into stmfts_configure()
  to avoid bunch of gotos to power off on error? (Dmitry T.)
- finish chip specific ops and potentinally remove is_fts5. (Dmitry T.)

Changes in v3:
- s/touchscreen_pins/touchscreen_irq_n. (Konrad)
- Use interrupts-extended. (Konrad)
- Fixed rebase conflict against 8665ceb926ec ("Input: stmfts - use guard notation when acquiring mutex")
- Rename switch-gpios to mode-switch-gpios.
- Do not define properties in if:then: branches. (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz

Changes in v2:
- Fix typo in the binding s/switch-gpio/switch-gpios/.
- Deduplacate allOf. (Rob yamllint)
- Add missing S-off-by. (Dmitry B.)
- Dropped irq-gpios as it's not needed. (Konrad)
- Correct x and y touchscreen area size. (Konrad)
- Correct reset introduction commit description. (Krzysztof)
- Partially implemented chip specific ops. (Dmitry T.)
- Separeted license naming cleanup into separate commit (Dmitry T.)
- Link to v1: https://lore.kernel.org/r/20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz

---
David Heidelberg (7):
      Input: stmfts - Fix the MODULE_LICENSE() string
      Input: stmfts - Use dev struct directly
      Input: stmfts - Switch to devm_regulator_bulk_get_const
      Input: stmfts - abstract reading information from the firmware
      Input: stmfts - disable regulators when power on fails
      dt-bindings: input: touchscreen: st,stmfts: Introduce reset GPIO
      dt-bindings: input: touchscreen: st,stmfts: Introduce STM FTS5

Petr Hodina (4):
      Input: stmfts - use client to make future code cleaner
      Input: stmfts - add optional reset GPIO support
      Input: stmfts - support FTS5
      arm64: dts: qcom: sdm845-google: Add STM FTS touchscreen support

 .../bindings/input/touchscreen/st,stmfts.yaml      |  19 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  19 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   2 +-
 drivers/input/touchscreen/stmfts.c                 | 594 +++++++++++++++++++--
 4 files changed, 574 insertions(+), 60 deletions(-)
---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
-- 
David Heidelberg <david@ixit.cz>



