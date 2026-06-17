Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E067BCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rYA3KULLu12L9czbGycOFuGOFS77ZpgJJJp4wZy7Wk=; b=uL27v81jvGqROeihNNxECGXRHN
	AmkfEGpCVmyJ/GPHjZqp4eokZ5sfG4Kq63OxsWQaVnm3GDMePS2pMwE9aX8xV+25UDf9LU0Q25LW/
	wwHFwMbdAuuvyOZtCP5dw3ojtRkg8W0BFg3dxl0XV4RTL+kG+P3J8zb7bnjoYpwP/SFU9MoJASV1R
	DJ6DYrFrYKhdNrkupeohoAOSdRA/ZO7Cor3C0gRC2q8J/Whu0CJ86n1CFxSDdZVYtK+QnylV0eV37
	wZKxSWf6j9E2RoIbbNNW6ndOPSf01EbI2/B6Ejo6Nr3oSvPrYpU0D2viwCdVimC9ZAAjDYDyyabyV
	fkO4KcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrt4-0000000HX1U-0Cxq;
	Wed, 17 Jun 2026 15:09:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrt2-0000000HX0a-08eK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 15:09:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92BBE32AB;
	Wed, 17 Jun 2026 08:08:56 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 286493F915;
	Wed, 17 Jun 2026 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781708941; bh=RlNOHlmPM/aS5sBQ7VG2OBOH3yLC8v+e7myxpqAb+3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqCcDpsV/LR0BQ9GMICFrEKsO4tbSKUncSYLPoqUkOuohfThz0L1OPI1vQWimfvAA
	 5TFThIOuL9eflj9IBhmsERD/guMB8yTdiJqWF0QFpgV25RMg1CkaayD6BHsUe4m3D2
	 D6HlqBqzXYSQVxQtOOm2W0LPXYBVCjt3npdPAGp4=
Date: Wed, 17 Jun 2026 16:08:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com, cristian.marussi@arm.com
Subject: Re: [PATCH v7 00/13] Add support for SCMIv4.0 Powercap Extensions
Message-ID: <ajK4gV9DMWtFxIgX@pluto>
References: <20260617095910.1963578-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617095910.1963578-1-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_080904_119887_E295F4E3 
X-CRM114-Status: UNSURE (   9.67  )
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

On Wed, Jun 17, 2026 at 10:58:57AM +0100, Philip Radford wrote:
> Hi all,
> 
> I will be taking over this series from Cristian and in doing so I have
> addressed a couple of issues raised by the first version and added six
> additional patches since Cristian's original series:

Hi Phil,

please refrain from posting big series like this during the merge window
in the future.

Thanks,
Cristian

