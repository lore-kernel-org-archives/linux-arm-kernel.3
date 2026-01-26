Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67105D13C0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pd8h7qHZwSelRxzXeyvfZNJH+IPPxDTlKu3H8jxA3fE=; b=lFyDdoTR5lVpZQhSysHc72tOGp
	EZu4pec6JivbycqcmUkx6N9rBa4A8SDgJs6nVXLmHSrTWWfGMlypmIFFp2Rj9nHnn/2tNfYFJolRk
	TziA4imDYG05/LqNG5R06xLb0er7PzCSyQbqJ+g3JaTzmY8b6BcrrT7AnNkUvczuHByHapERZQSvl
	Sn2FC2/TfgQHCjpWH8PezVGX0kfafhCYHnhtHiXTr6EEdAbiVtBPh3pCWExsJLgEYvTHhnA7AxG+n
	mW0GRHxfaEow3cheTBNyQPwtgGrdsEobzMiCkIWhwntZonC/Vt5aY7dK9Yti35+N9JXSeBZu1N0d5
	MdznhriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMnZ-0000000CdLG-3u3J;
	Mon, 26 Jan 2026 13:38:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMnY-0000000CdKw-3ISQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:38:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE8EC60144;
	Mon, 26 Jan 2026 13:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D44C116C6;
	Mon, 26 Jan 2026 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769434711;
	bh=Be0TIhWmqT/RZLmooeWWhCuzdKF5DM1tcofGzKCBFLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnFN7xxCUGHYU/3+sQaxZ9Nl3FzCPpEacGee/Z6HBDRkroJODWb7uaEcptZMhQ6AE
	 pAMyjm2CTMeLLPSDVFaXEvUHuvEJiTYYIzyedJOZeIV2VAfRJZ0P15m1J8rHRrrBHj
	 AyYiGe5DEeZFcycx3EOoTwiWmII1Uq1Fz+ZfLTGCCeKbUMAhWz9YP1Y8EavfUBATmZ
	 p7EXqVmT7uAmD73tZ9fqdD3r+YPd8cVFfd7S5w/DX1NwaIfO5/CVRKZuG6Pm7pWaaT
	 WyE+7UmX0rRkIG1zzTRn/UztujhOvq7u3OTAy3q2cKwTUGw33FUJXhN683OKulf41R
	 eaksh+D7eMdEA==
Date: Mon, 26 Jan 2026 14:38:22 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
	Song Xue <quic_songxue@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v19 00/10] Implement PSCI reboot mode driver for PSCI
 resets
Message-ID: <aXduTklGm6AOeaGG@lpieralisi>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <2dcd9e3a-0a40-0dfb-29b8-99b70b73a59a@oss.qualcomm.com>
 <9e9b9faf-7c5d-2e83-a8ac-37afeffd81d4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e9b9faf-7c5d-2e83-a8ac-37afeffd81d4@oss.qualcomm.com>
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

On Sat, Jan 24, 2026 at 04:08:11PM +0530, Shivendra Pratap wrote:
> 
> 
> On 1/6/2026 4:38 PM, Shivendra Pratap wrote:
> > 
> > 
> > On 12/28/2025 10:50 PM, Shivendra Pratap wrote:
> >> Userspace should be able to initiate device reboots using the various
> >> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> >> patch series introduces psci-reboot-mode driver that registers with
> >> reboot-mode framework to provide this functionality.
> >>
> >> The PSCI system reset calls takes two arguments: reset_type and cookie.
> >> It defines predefined reset types, such as warm and cold reset, and
> >> vendor-specific reset types which are SoC vendor specific. To support
> >> these requirements, the reboot-mode framework is enhanced in two key
> >> ways:
> >> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
> >> arguments (reset_type and cookie) by encoding them into a single 64-bit
> >> magic value.
> >> 2. Predefined modes: Add support for predefined reboot modes in the
> >> framework.
> >>
> >> With these enhancements, the patch series enables:
> >>  - Warm reset and cold reset as predefined reboot modes.
> >>  - Vendor-specific resets exposed as tunables, configurable via the
> >>    SoC-specific device tree.
> >>
> >> Together, these changes allow userspace to trigger all above PSCI resets
> >> from userspace.
> >>
> > 
> > Hi Lorenzo,
> > 
> > Is this patch series now converging towards the design changes you
> > proposed in v17? We’d like to conclude the design so we can move it
> > towards closure.
> 
> Hi Lorenzo,
> 
> Can you please review if the design aligns with your proposed changes?

I will try to do it this week.

Thanks,
Lorenzo

