Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE83C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BvbNBLloRSv8ElrT72fx3PwVc7bEOOXc32Z9sS23w5s=; b=Jy8vw0SB5/aC2Ie+z8/ChE7KvQ
	4hFTjjpVrwFVfPTVOVJXxXWX37CaRKm0x/sTqpGHae83sTYf5DrPuXdO6xwIuBeEIw6KupsFGoTc7
	6zKZbGJLO5qHj3o6i3vgI99x2iMdyvkwmOGcpSSQHGCPddX/frKozAr1s9W58U6ZxJCVSZyco3jAz
	wYSc2XXxW32NLmPG+5P1J7oRYZ8QCz6vaK89WFsu2AhMzz4QFToEZtHqoQyr1voJNzHuX/Yj3aJSS
	LME6wj1tZ1fSJ6pVuKM3cmIZmvJ6r/Et1BtkSsKd8DsCWmwpD1lBXOuP7z/4TUGrv5fd94lDAKUC1
	VhXRQPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14F4-00000009vLV-3pHu;
	Mon, 31 Aug 2026 15:48:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14F1-00000009vKe-3jyw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:48:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so20608175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788191290; x=1788796090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvbNBLloRSv8ElrT72fx3PwVc7bEOOXc32Z9sS23w5s=;
        b=C8abKbM9CXEa7cBGDSQOUIME7xLkVdAB03XDA0UCHtPVBdH0finw+Mc/QQ5Br6icFY
         Qen+N4p6UXOpsnWoty47ZXp0Jl0pvmBU9FmOKNQlcjWJfQjiHpOj5a612fI10wQ7+4pd
         QWqxRycr3/w/m0qyL1q2gX5CFHGU5wnKhAbXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191290; x=1788796090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvbNBLloRSv8ElrT72fx3PwVc7bEOOXc32Z9sS23w5s=;
        b=VycBUvSU9oiNV7lygNxCN1tRBHnC9Lt3QvfnEFtj6+hI6Ul7p7HiUQiOSMNlACjN6r
         OWRX/dmGFtQZnYFWznn1OjazGMpCA3WeheVb306nvAknldf83sdOiw3orSQkYgT/1qPW
         jiPGPGXdunnfeH/hS43Rx6aJqk7BY5+QhDNwNwxTlGH5F0anCDKB3Nqd21gp6ipQMQpk
         8INudFZAADeclSDcYtzoMKGPNZ70ELz84cp7n+kuukoHZIZYCPOxy9J8oXITCWelnPWd
         RuxT7eQvUv5HaXW76VmLyOhQSw5FGiwuT+BRdMOW1KIUFmgzjhGKLsHxzxoHrnYMjvpi
         qM9g==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Ba57bAl+k+E/zowHgg15Ce1RwieFe05YqrIvyR/N5vwzgxN/teXziHqpXe1kWUxbJSeSVpWPImvSt+sAMU59@lists.infradead.org
X-Gm-Message-State: AFuF++lNPTDNjVA7bkruCY23KBWrQuAB07vG2MGjY/RNBBacMtUEXzDG
	keLzWhHeFQUdpRbkbZsV0nrlW/h3wCoN91OSySAwU0XC2tHkUHJFWkYx97iud7yF7cs=
X-Gm-Gg: AR+sD10snqyIdjq177okt91/HDAqSy+H9qED9u9oJkBQFrlazH+pyYGAk/HalWQ8ltx
	eGM+AO0LVUWlHxQREcrtZcHSYkIenQCQdvv7hvQTNbOdmI0yBo814NbvbW9p0gcrrlxls2mhoHU
	ceQhRKFA3AJhc6CUBm+aOQYnKc8Bxjf3oDR06PhgzB4Qz7V3MoOW7S8/wzDT2hAgSURmdNs8BCb
	QtJGWVMLkTxVmtgGOMsjvqx17TbDhCMrBXGAGf03mYj5mxpgirJH6Iw9hIOvBal8LM4QVps//6v
	FibkbcRhSdJVqp5W/MhhfTsPgW8XvKEjnU1qP1T1ZwzvklAJLULQyg+sLWcUKEwErXb/Rbm/lFJ
	w/AtwcXAy+eryu/Vq2S4ot3cCJDdLApjktA40ZrZUdeRUk+PW83T+U3zY1797+i1QD0RU07ez6L
	FIrQA1K7rlfZKM0nN4Zuz6y0YCxuDM7ax68HCa/lLBnHJjn7lxfeLY0/rdU3IWfsIO80YkAVfwJ
	sq9vK4GUwfix0TT4Fzc4HZzCZbVzd+ZsmheLPckYh324SKtrdHEgPMXhsVKGU7BrHOUPsyl7ZvC
	yYrQVqKQzJ0O8ZaOFtm6kWPcRNDlM5AGZPpBk/F88/F/UB8ejGlKjrGfAuUE
X-Received: by 2002:a05:600c:c490:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49b91c17294mr422161085e9.1.1788191289687;
        Mon, 31 Aug 2026 08:48:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm220191845e9.4.2026.08.31.08.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:48:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 0/1] Support spread spectrum clocking for i.MX8M PLLs
Date: Mon, 31 Aug 2026 17:27:00 +0200
Message-ID: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_084811_960312_EE9A515C 
X-CRM114-Status: GOOD (  15.61  )
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

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

Changes in v10:
- Drop patches 1-22, superseded by the generic spread spectrum clocking
  support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
  is no longer needed. This patch is now based on the following commits:
  - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
  - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
  - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
  - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
  https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (1):
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/imx/clk-pll14xx.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


