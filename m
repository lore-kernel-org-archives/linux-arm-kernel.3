Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6345E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFz3s1CFjE6t1qXyQazLG1+Np6SNVtBUamtmmBnMn3A=; b=iTqbBfyRPmKBhojAjfFfk1k/wm
	2C5AV+/QVjZnjNryvrPh0Q8DbKeoW+M0YfqBWW0u3qkGRcaYMaSc41LTOA/sIdS7lqsmDpUH/eIvT
	ZJHNyz2lARgqsiOqM6I9bKA3diat45NEDqKdJDrdEWrlRpWRVUvofsFfJbzq7ihq85Z6ZbnbpprxM
	W/ytHTRWX8ATyOjz3+mpa08Y1wLWO6MNa4T39BqDoBpuTcHwD4/7oulmTbdQqDDEIeUvsojZJl8Se
	RArJR1ozFtealgT0nXdsP8aD0yBCOxniQ9wJRk0FvS7QZM599ALcT/3JoPhoemj0PHVmcxc0MkUVa
	8E8WtMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQscS-0000000GDG3-0kNR;
	Thu, 26 Dec 2024 18:30:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQsaN-0000000GCrM-2kR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 18:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6765D5C5952;
	Thu, 26 Dec 2024 18:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8F7C4CEDC;
	Thu, 26 Dec 2024 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237670;
	bh=VP0YmaV52KiBLWvUfKNgIGV7VPXZlEnTFAFGrFi4buI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZwQGlyp0zo85l+eI3NfBgOOhrjLM87OVqzV7R1uqZq2RUYmAHw3y4WNvZCiAEmTjK
	 lWxfv2c3D2XKygSM4C+c98UanuQklAZhL+sjxoFNUDN/Inn23+vLC5QxfjcisGPQpt
	 2r8OZf2ZP/5vOjoJHj/dL11HuRWSPVbxH2c2vyLHyPG1hMY4tj9EmiztXnd9j1P9IN
	 cHRM4LLaXq2b42UCw8CLTOmA5/btiN/Wx71VpXp21p8DwxoICrkXafDjZbfR2CU9AM
	 0t+VlocDiREo5YyIX07Wmz9O3zXX3IcpOTUplwoAPnXXUlrKuLfWGx6U8QxeDBILho
	 zBxdJcCjvM6aQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable sa8775p clock controllers
Date: Thu, 26 Dec 2024 12:27:05 -0600
Message-ID: <173523761387.1412574.291134430312189223.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
References: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_102751_738590_70EBE132 
X-CRM114-Status: UNSURE (   6.30  )
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


On Thu, 24 Oct 2024 23:22:55 +0530, Taniya Das wrote:
> Enable the SA8775P video, camera and display clock controllers to enable
> the video, camera and display functionalities on Qualcomm QCS9100 ride
> and ride rev3 boards.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable sa8775p clock controllers
      commit: 8592294dfc7b46c7b964f453d64e90e6c1137090

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

