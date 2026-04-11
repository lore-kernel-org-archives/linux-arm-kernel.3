Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F107EF45A19
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 08:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7s28u91RY4sb0eXvmbry/utC+BuQrhKUtGgZ/bEf6k=; b=U37Fhs8PhTLtQS7adG9JahZaH2
	8QCTJjAleDX1fjDGIOZ1kJbFhK2lIQ6KM4Sqc6L1cgLZPpwjOyubYU2Z8jDlinnoeKpwR4G7NJng1
	AmtDDZsx/0jEIoIg+X+xPzk4+ZiEv9GMelmo2tOmmjtpeuwecuBurledgLMpY15qY9EoMN04V1+cc
	hhA1s2f9fNDu9yXOKncbMVi2sVpngmwwiPTfv/x+NiPZSo62gWwcOtpMwKajAWkQJ3QjNiTHhWQoz
	toJhvpO3L+yzXFXWmRfjUMqkXxKRAJ99bslNrXxtwq3ycbLUZ1eQkUhNJq9iAL3CLjdO7hGAw1Wir
	BfRo8C3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTpQ-0000000DHAW-2VxT;
	Sat, 11 Apr 2026 08:36:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTpP-0000000DHAN-0joY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 08:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 313F260141;
	Sat, 11 Apr 2026 08:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60921C4CEF7;
	Sat, 11 Apr 2026 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896589;
	bh=wprADVJKu9wHnF7hgXcFtU3lqaLTiDIRd/Vv8wZiTZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEq+8xdWHBmKWDgsA2JDojibVUDQ9tmJo4A3w1aQXafDDRStzOQqLETOsS6bezolZ
	 UKhyks9z07BeunXBMPTFcVyXwkKc0zQmsEAw0lrzUp2Crii6pe5I8k39RO0E9l5UtF
	 k2Cvmuvh7v1MW7uxqVyRwtlzFW3Hw/RGw1QBtpNQLqPv7QRY1lc8/9HBs7vOTVwpzD
	 0r72IMin8TyOAnSaiiiWsVM0mMCMv2nig7HJ/pklvK0UAmv35RXys9qVuScr518QBz
	 Vz4nqNB73JpzeVIrrTtCBQHEZGJ17N/QqSq0gqcbw+LIs7vMlRyX5dt9+dmoGAm43+
	 qyUPV2pSRQN7w==
Date: Sat, 11 Apr 2026 10:36:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Paul Sajna <sajattack@postmarketos.org>, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, 
	Sudarshan Shetty <tessolveupstream@gmail.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Casey Connolly <casey.connolly@linaro.org>, Jie Zhang <quic_jiezh@quicinc.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Alexander Martinz <amartinz@shiftphones.com>, 
	Amir Dahan <system64fumo@tuta.io>, Christopher Brown <crispybrown@gmail.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>, Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [GIT PULL] A few more Arm64 DeviceTree updates for v7.1
Message-ID: <20260411-strict-nifty-otter-fcd6dd@quoll>
References: <20260406132007.2264408-1-andersson@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406132007.2264408-1-andersson@kernel.org>
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

On Mon, Apr 06, 2026 at 08:20:07AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit b683730e27ba4f91986c4c92f5cb7297f1e01a6d:
> 
>   arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 09:35:01 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.1-2
> 
> for you to fetch changes up to af241225893ac4933bb8f0615f2dfda8ea2326ce:
> 
>   arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X (2026-04-02 16:08:54 -0500)
> 
> ----------------------------------------------------------------
> A few more Arm64 DeviceTree updates for v7.1
> 
> Introduce the Hamoa-based Lenovo IdeaCentre Mini X, the Dragonwing
> IQ-615 (Talos) EVK, and a Talos EVK camera overlay.
> 
> Enable DisplayPort support on the Glymur CRD.
> 
> Add WiFi, Bluetooh, LEDs, and venus on LG-based SDM845 devices. Add
> battery, charger, and display on the LG G7 ThinQ.
> 
> Enable SD-card, describe the audio amplifier, and increase the speed of
> the i2c clock for touchscreen on the SHIFT SHIFT6mq.
> 
> Add camera subsystem, camera control interface, GPU, GMU, and GPU
> cooling on the Talos platform. Enable the GPU on the Ride board.
> 

Thanks, applied

Best regards,
Krzysztof


