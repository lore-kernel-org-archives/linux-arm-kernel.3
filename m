Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158CCD1039A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flMOFoC08YdoRcIsEqEXJn2SqN/3u4NYt0+WsEG/54I=; b=DF4DAKbKEdJdCC1x68RU0CFvNG
	kAcT31+BkFUwV9HRPR4CiPK84sggj0L71edcNR4LPlLtkUOKKyinHKa29HpaVuS0V+rm9TXCU13qM
	aKt+UEImIyDK9oIRfMoK/WJ9Np90LoP4yIG1Hzk0qFZVreie6aMjGOiLS/xzxuYIFICjTZnUT4McN
	7SSq16RQzAJ2o8C8wn9B8zoD2h9LtHmdEgW+N27EkfdD2A1gAp9bzjcQfJm4NjFZgH56ewcyaWYvA
	+D6vbc73Wqkqmf/SiMkZ9zswGvRI78Eh2Q/npBLihFJWON7D+yr3pE70NJYup6kQxaXc8eUXVkcck
	FmaAAKAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Pe6-0000000AuTA-1RVc;
	Mon, 28 Oct 2024 13:18:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PcS-0000000AuLO-2o84
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 13:17:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7710D497;
	Mon, 28 Oct 2024 06:17:45 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70ABD3F66E;
	Mon, 28 Oct 2024 06:17:13 -0700 (PDT)
Date: Mon, 28 Oct 2024 13:17:06 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, quic_nkela@quicinc.com,
	dan.carpenter@linaro.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: firmware: arm,scmi: Add missing
 vendor string
Message-ID: <Zx-OHucz4xOL8eyj@pluto>
References: <20241028120151.1301177-1-cristian.marussi@arm.com>
 <20241028120151.1301177-7-cristian.marussi@arm.com>
 <Zx-CHlAb61FWdzkA@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zx-CHlAb61FWdzkA@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_061716_782349_340769F7 
X-CRM114-Status: GOOD (  13.39  )
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

On Mon, Oct 28, 2024 at 12:22:54PM +0000, Sudeep Holla wrote:
> On Mon, Oct 28, 2024 at 12:01:50PM +0000, Cristian Marussi wrote:
> > Recently introduced max-rx-timeout-ms optionao property is missing a
> > vendor prefix.
> >
> > Add the vendor prefix from the original committer.
> >
> 
> It should be "arm," not "nxp," just because NXP happens to introduce that.
> It just highlight that the property is X vendor specific and here it is
> associated with SCMI and specifically Arm SCMI, so "arm,". If for some
> reason nxp or any other vendor overrides this definition and need to add
> additional property then they can add their own vendor name into that
> property.
> 
> If there are no objections, I can fix it up when applying.

My bad. Sure go for it.

Thanks,
Cristian

