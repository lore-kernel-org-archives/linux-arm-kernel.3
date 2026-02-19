Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9F0E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 02:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6Lo/vpKRMZd3qm8frSn/6kA7hUJE9bG7kBiaNh14a4=; b=KykL4hNrE+pNBRTe9WrteYi//C
	B/mgwb8rELZ/CDtITGSSuj4MD56TEUZJiqrhA1krocgqxLdOLDlm5RdfGcgS2dSYZhayVADwFC1t9
	q7n2LKNO5/tU2w41xCPDLAwFLn78ly0k3+NlLWpQ8sKIGzNutzfBL1HzjK/7rMlyhkO6WJVizipEP
	7udpE77FJzL0ZDeCOTL29qKcWSomXWiqUVl0kXMvjvQbHJOvhcFghMIF6dEtORSqn+9q1QGweUp7G
	xAtsjWA+JhP/9/GsOudtSWSvMvm7GZ9nj4cS/DLmnab5t/6pwoAUuorBIsP9BQ9qF5q0nPOoxQoMG
	0XsduAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstPx-0000000AjK5-0RZW;
	Thu, 19 Feb 2026 02:05:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstPc-0000000AjBL-0Irn;
	Thu, 19 Feb 2026 02:05:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A67944328A;
	Thu, 19 Feb 2026 02:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8320DC19422;
	Thu, 19 Feb 2026 02:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771466703;
	bh=lOZidEmx5vk20ZO0QrhgAGaGcoFEhk4bJAlW3AJLUOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bDrkdjbvtDnkfPHNkqW2l+/iLzj7A9E2KZ5LDUUqsThA71UtRLrKT8/GtBrU0hKtX
	 0QnBkfBkl2+pfGFAMeyaCytwZPKIy1l4WRJ+egUX/UK6y9D5/kk40EwITuUJ1d/RfH
	 oTBBs+eo0JJm+X8QnjVGeFCgbY1ZyVxKCeDDc+076WdGwRDJ/7NjaXUNq3j0fsedaQ
	 k9JqfvSP3k4QMvEidLcgJlvVkF2bKn/IwM8JKuJzjMJSy4pL4OhCBgZ3H3uACFXgiN
	 U8uqCKfAnKj72b8ab2N2uBMg2aT4Z4/p/WnPtA4iNZqPlRbjL5LUl7EgfUznrLL6YM
	 hO2vOUtxbCp5g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Xu Yang <xu.yang_2@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-5.10] phy: fsl-imx8mq-usb: disable bind/unbind platform driver feature
Date: Wed, 18 Feb 2026 21:04:07 -0500
Message-ID: <20260219020422.1539798-31-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_180520_350209_A2A601DD 
X-CRM114-Status: GOOD (  21.33  )
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

From: Xu Yang <xu.yang_2@nxp.com>

[ Upstream commit 27ee0869d77b2cb404770ac49bdceae3aedf658b ]

Disabling PHYs in runtime usually causes the client with external abort
exception or similar issue due to lack of API to notify clients about PHY
removal. This patch removes the possibility to unbind i.MX PHY drivers in
runtime.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20260120111712.3159782-1-xu.yang_2@nxp.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis Summary

### What the commit does
This commit adds `.suppress_bind_attrs = true` to the i.MX8MQ USB PHY
platform driver. This single line prevents the kernel from creating
`/sys/bus/platform/drivers/imx8mq-usb-phy/bind` and
`/sys/bus/platform/drivers/imx8mq-usb-phy/unbind` sysfs files, thereby
preventing runtime unbinding of the PHY driver.

### Problem being fixed
The commit message states that unbinding PHYs at runtime causes
"external abort exception or similar issue" because there is no API to
notify PHY clients about PHY removal. An external abort is a serious ARM
exception that typically results in a kernel crash/oops. If a user or
management tool writes to the `unbind` sysfs file for this PHY driver,
the USB controller client would try to access the now-missing PHY
resources, resulting in a crash.

### Stable kernel rules assessment
1. **Obviously correct and tested**: Yes - this is a well-established
   one-line pattern used in 385+ files in the kernel. It's reviewed by
   the PHY maintainer (Vinod Koul) and reviewed by Frank Li.
2. **Fixes a real bug**: Yes - runtime unbinding causes a crash
   (external abort exception). This is a real, triggerable issue.
3. **Important issue**: Moderate - it prevents a crash, but only
   triggered by explicit sysfs manipulation (not normal operation).
   However, system management tools or user error could trigger this.
4. **Small and contained**: Yes - single one-line addition to a driver
   struct.
5. **No new features**: Correct - this removes functionality (ability to
   unbind), it doesn't add any.

### Risk assessment
- **Risk**: Extremely low. This is literally a single boolean field
  being set in the driver struct. It only affects sysfs attributes. The
  same pattern exists in 385+ other drivers.
- **Benefit**: Prevents a crash scenario when the PHY is unbound at
  runtime.
- **Dependencies**: None - this is entirely self-contained.

### Concerns
- The bug is only triggerable by explicit sysfs manipulation (writing to
  `/sys/bus/platform/drivers/imx8mq-usb-phy/unbind`), not by normal
  system operation.
- The fix is a defensive measure rather than fixing a root cause in the
  PHY framework. However, this is the standard kernel approach - the PHY
  framework doesn't have removal notification, so drivers that can't
  handle unbinding should suppress it.
- The change is straightforward and would apply cleanly to any stable
  tree that has this driver.

### Classification
This falls into the **hardware quirk/workaround** category. It's a
defensive fix that prevents a crash scenario. While the trigger requires
explicit user action (sysfs unbind), this is a well-established pattern
in the kernel for exactly this purpose.

## Verification
- Verified `suppress_bind_attrs = true` is used in 385+ files across the
  drivers/ directory via Grep search
- Verified 7 other PHY drivers (Samsung, HiSilicon) already use this
  pattern
- Verified no other Freescale PHY drivers currently have this attribute
  (this is the first)
- Verified via git log that similar commits exist for other subsystems
  (gpio, perf)
- Verified via lore.kernel.org that the patch was reviewed by Frank Li
  and accepted by PHY maintainer Vinod Koul
- Verified the commit message describes a real crash scenario (external
  abort exception)
- Could NOT verify the specific crash reproduction steps (unverified,
  but the mechanism is well-understood in the kernel community)

The fix is minimal (one line), extremely low risk, prevents a crash
scenario, uses a well-established kernel pattern, and was properly
reviewed. It meets all stable kernel criteria.

**YES**

 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 91b3e62743d3a..b30d01f345d20 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -730,6 +730,7 @@ static struct platform_driver imx8mq_usb_phy_driver = {
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,
+		.suppress_bind_attrs = true,
 	}
 };
 module_platform_driver(imx8mq_usb_phy_driver);
-- 
2.51.0


