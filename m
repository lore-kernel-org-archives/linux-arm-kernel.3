Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808B3F45A19
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 08:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTQe0cV0rXM423pPyTi7hdpJU61zMoy+34StNWbQV1Y=; b=hFT4BfoIWH0LjKcIlXyJ2Hd/h0
	XQqULwUkGDb8pTqF9CBHeDvmz+Z2FcDlBLP/CIGd/+SPPri53QSPUaIxXVZi8R37GqvoxBFIzK2A4
	x6P2cbhuKZgCkiqZX0T/3j4CFz64Nqfog4DF0VB0d7msII2dx95qFe0ZZCx36v1qmo5lwsOT5q4l+
	W3hZYdHhz+qqJ7S+wkLB+JUWJ8+komaw4taYFA+jsu5w2pgrfK+lvETkkgP8NvWZGatF+GET47mGz
	e/e7mF2hYwWqoLFEaz4Osyxwd6DEdhh5ZezooCMYNU3trdfFQvC55HQ+z/eWaD94Th5+tR0BWJERq
	rdz4fsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTrV-0000000DHIq-0PUx;
	Sat, 11 Apr 2026 08:38:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTrU-0000000DHIh-1JBp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 08:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D2A260142;
	Sat, 11 Apr 2026 08:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631EAC4CEF7;
	Sat, 11 Apr 2026 08:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896718;
	bh=WJwPAsSYyhBmXwIaIw1VAto7NG+MlEuN2t6R5r+/qJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KojuZtuXa+vfA+4gyCMqMFo1YA6loJ6n8pXUWBGJKSsrjBq6nD9XMBtxdy95aFDZG
	 upszcPCrjivP+hrJcwlzW4LAnH4rY6Un69RhXgwhOKRxnC5MjZgulSlOOb8M8vhNDE
	 VOJosRb7JzeG130LU17K7XZq9xAzym9kEUWxtqhNmEVgF7T0OdNeia0hvlUg2Cyicn
	 ZkAe80SSGgXH/Zik5Ol0Bm4rsW1Tmcg26AMnCmZjpgwlgybjGKv40sk+gj/YnGh4Wu
	 WvORo8CJdOUvDpC8VaQ1fup7Z+7V7/ZxHVnGRjQdzeCnDD9D5yI5OSRUT8VLwCpTM3
	 VBdHT3LBvtkoQ==
Date: Sat, 11 Apr 2026 10:38:36 +0200
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
Message-ID: <20260411-amusing-hot-koala-cfcdaf@quoll>
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

A note: your GPG key has expired. Consider dropping expiration time. At
least I am planning to drop it in my next keys update.

Best regards,
Krzysztof


