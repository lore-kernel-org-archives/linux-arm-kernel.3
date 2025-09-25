Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA17CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eo5MQOkGyElXlEHPuquWDvolz5tCt5MH2A2PG0iQrcA=; b=Si46PkF937l2Tv8fkNa9cw/vH8
	dTHd+X5d9cqk2XUm6Dkex11LysapnQBYZ0f/s0lfMIXvOD9UCGCwRSZsNIUppo+eYwZI1plSRDr5l
	EBPlEa+MClxCTio3fv8txTK2Efh/KPkUItsNWtSzAAoM6MD3CGnGRJogWsF0fWivc6zFTe1JX0LOY
	cU4W4++uQeglr0qosuRJu343vBebDJaxBkNRKuZOgqILgvyvJ2XlXgf390vWfVYMPm9+D0wJ3HAUs
	zjKH7U0JRGeeNKBwd292B0QH7h3PZvMvHTi8XGsRxJojS9oaZH8/d+5dSXrz4+93HJ40jInR4W/zh
	Sc//cVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kpQ-00000008qNt-0URc;
	Thu, 25 Sep 2025 12:12:04 +0000
Received: from mail-m49224.qiye.163.com ([45.254.49.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kpN-00000008qLP-13cQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 12:12:02 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 240dfac53;
	Thu, 25 Sep 2025 20:11:56 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de
Cc: adrian.hunter@intel.com,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	will@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH 0/9] arm64: introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board
Date: Thu, 25 Sep 2025 20:11:54 +0800
Message-ID: <20250925121155.2401934-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925090412.2068216-1-yangzh0906@thundersoft.com>
References: <20250925090412.2068216-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9980c98bf209cckunm0dbea3318270a9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaT04ZVkNOS0NKSh0ZT0pCT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=lMq0ZdblTM4Zv2oMG3N+IorP8ydfWF/POg1If0IxGoUdZpVXrgamH/KY+J5nm03NYw1du4yJQMv12lrKqKLjh5RdA40kpajnglkSyGdO8hNpW9vHCtTkuls4L3JFqxzTZqPUg1DjwcWPvdkKPPFQsrwAwYGCOtKsvuT5kiIIRuI=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=eo5MQOkGyElXlEHPuquWDvolz5tCt5MH2A2PG0iQrcA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_051201_475678_C4A5D92C 
X-CRM114-Status: UNSURE (   8.79  )
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

On Thu, Sep 25, 2025 at 05:03:57PM +0800, Albert Yang wrote:Subject: Re: [PATCH] splitting SoC and MMC parts

Hi Arnd,

I may have missed an important detail in my previous note. If I split
out the MMC-related patches and submit only the SoC parts first, I
cannot validate the SoC on real hardware: both the kernel and the root
filesystem live on the MMC device. Without the MMC stack (DT bindings
and the controller driver), the board does not boot to userspace, so I
cannot properly verify the SoC/DT changes in isolation.

Would you prefer that I:
- keep the MMC pieces in the same series for initial bring-up; or
- validate everything locally, then send only the SoC/DT parts first and
  follow up with the MMC binding/driver as a separate series?

I’m not entirely sure which approach best matches the normal workflow,
so your guidance would be appreciated. I can proceed whichever way you
think is most appropriate.

Thanks for the review and suggestions.

Best regards,
Albert 

