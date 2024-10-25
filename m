Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F88BD0C612
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyGjiBtuIDp3TxYQDGvFq79fbFInI1W4/sh3zHJzTjU=; b=4WDEz/D9rzTdGX1fR/0WiwQHmM
	h1M/9EmPV9/YRhXBOrwe1/Sfw24ijikyTSLwdUdt3oJecIJKmvXI2N+W5VOm7PJ1jDGX687ChnQ9K
	9ob4XGgV0yflcDknBWWIa6Z6nVUnsNxE0fUfugorRpytgH8KEIdjd2b1gl31usRErUgaca/yMRitK
	RtQp6CCNXVEe3X9e3gQ3yS1q5sgXqIfqWhq7tHiBkGpORNxmzhbpBLp2YPH3zvdAxAyE91AqfaMaw
	C2Za5aLF7P0sNUKHF20Na8EAsbNFcux1VofnuQ/hJu7vDpzrLuC3lMnBXT6rjntPreknKifc12ZNC
	5le+bVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Klo-00000003tN1-3jT9;
	Fri, 25 Oct 2024 13:54:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KQf-00000003pSV-0xez
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE51FA42EDF;
	Fri, 25 Oct 2024 13:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79C7C4CEC3;
	Fri, 25 Oct 2024 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729863156;
	bh=v+TIq5Hs+T34ql7qTS7QA5QIGOI10d3BPzw3MOJHPjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cqy6OX6/+cX8BA9XID33+3sylxcFaV2QoZm5JbvALDgiV4XUTZPYfMG1T91X0RQ5J
	 oiOzw9IqVK5+cBnKGQeaYPk3y1e3UwC/NvHWB1QE9RVyudiAx7cKOagK9vCHSmyKTb
	 bVbPx9bk1GAIdkBxRslXYId2Kj1IkJa+0bCQA3Qfg7Qjp0IXCOcjXbcg92AoIU1aWx
	 36Z1ooxrMn3JOdKXi/yAmr6TtYBqEzSiFUguzMb7nRDC4ziIB+ND0VAoHwQmKMjXBN
	 +h6VNQK5QGP/3c937xAvKywC9Ezpo4QN05XTPOMTwJvn4mj0mioQ02RRb6TJYLctQF
	 Qz3reD95Wv4wQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t4KQv-000000003F4-2HzN;
	Fri, 25 Oct 2024 15:32:54 +0200
Date: Fri, 25 Oct 2024 15:32:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	ulf.hansson@linaro.org, jassisinghbrar@gmail.com,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org, linux-pm@vger.kernel.org,
	tstrudel@google.com, rafael@kernel.org
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
Message-ID: <ZxueBWB9nJ9Mt7bW@hovoldconsulting.com>
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com>
 <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
 <ZxkjqEmkBAsC6UkL@hovoldconsulting.com>
 <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
 <ik4dyfbphm7lkeipm2dbr7cmdfxewxd4jtuz2jfnscfwcyo2r4@lrin5hnsqvyd>
 <83b635a7-fc69-7522-d985-810262500cb3@quicinc.com>
 <CAA8EJppx1OmYnfSsMDebRRTbNb3dfAE_MM55T1SpLccP=s_K1A@mail.gmail.com>
 <Zxty8VaMPrU3fJAN@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxty8VaMPrU3fJAN@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_063237_351133_150558D2 
X-CRM114-Status: UNSURE (   9.05  )
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

On Fri, Oct 25, 2024 at 11:29:05AM +0100, Cristian Marussi wrote:

> > > >>> [    8.098452] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>> [    8.109647] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>> [    8.128970] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > >>> [    8.142455] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16

> I think dev_info could be an option from the SCMI perspective (as per my
> other mail), the important thing in these regards is to NOT go
> completely silent against fw anomalies...to avoid the the risk of being
> silently ignored .... I'll see what Sudeep thinks about...

I agree.

But could the error handling be improved to look less scary for an end
user by saying something about duplicate entries being ignored instead
perhaps?

Printing something at info level and with a FW_BUG ("[Firmware Bug]: ")
prefix as was done here:

	https://lore.kernel.org/all/20230414084619.31524-1-johan+linaro@kernel.org/

should make it clear that this is not something for end users to worry
(too much) about.

Johan

