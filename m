Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D10E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeLBf2kZBekmkGR5TmRM3fQyR+51vh+4BSntK6/w1U8=; b=zKsDBhEWqUw+tQ3IMTUB8t+HMp
	mbiafSg+M4cQAK0/OL9Ri1gSo2qu0wnh3zvlyunKZj+SoYLJX0OK9nmCXENc4WwpJHyNYNQNHZQ+Q
	LvqcWFaOUdWzDYcDMIZVwGFHdfFyXWFjNPuYWqP1bzJRazoy0s1g1s9miGuPK6K7B4r0x+1USH6za
	UukNT1jdoRo+ve0754DANtPz1PJqq6tYyKd6Kbcpt3aQAEx4UPPO/Q9hU41QMNZ8PO39QCY7f57ON
	xnd8kop29rcEw0uMs5oZOu/k4dWF5v/qz+jxbUrMvaBW+JU33LM91uxcQ8B8RaCAQLY+4SAWqqw62
	kx4ir1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEBi-0000000Gdez-0WDE;
	Thu, 05 Dec 2024 15:54:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJE9y-0000000GdNe-2ext
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B45F3A43E15;
	Thu,  5 Dec 2024 15:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F68EC4CEDF;
	Thu,  5 Dec 2024 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733413977;
	bh=QNI5z8VVLHR4iSqkF2o+2ppPCvhP1+pFGu66x6cXsWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qT4ZzauCkPbwV/SSrIePuyf2eTG5YGJfzZzwrnjzdq+XWIe1oLEip1LoRBPSjrNrP
	 M74C4Kfm7+wMA5UfUBImGgSKeLsyrzBOHjQmBMAOKzEumJ4lSClyQVpPh4N9UIvP+m
	 ZhqfXkwg5E5CyhTtI7fbQ7NbcHGVrXZNsftO0Ycmfk+qmcwYdDj5OSspdtUlW6dtsM
	 yT65kLLv0B18yZwADAtSfR39ZlhtkVPySMwdRlqUAY//WxuzDM4QxY6XhtlaUxIpJX
	 ptBmlR8csE2kPwh0gAa0hKXm5WCAK0iz4Ad1LgIBj8AswEMk3DwniU+Gm64gG0q/lY
	 NrM4sKOnxhUFQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tJE9x-000000002kQ-1W8O;
	Thu, 05 Dec 2024 16:52:57 +0100
Date: Thu, 5 Dec 2024 16:52:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Z1HMWUa_QCsNA1-Q@hovoldconsulting.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
 <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com>
 <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d61bb7bc-d824-883a-4edd-109ae74076c1@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_075258_737062_6CA4EA92 
X-CRM114-Status: GOOD (  18.34  )
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

On Thu, Dec 05, 2024 at 04:26:55PM +0530, Sibi Sankar wrote:
> On 11/22/24 14:07, Johan Hovold wrote:

> > I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
> > there too, and there I do *not* see the above mentioned -EOPNOSUPP error
> > and the memlat driver probes successfully.
> > 
> > On the other hand, this series seems to have no effect on a kernel
> > compilation benchmark. Is that expected?
> 
> I can have a look at your tree. But memlat in general
> depends on the cpu frequency when your benchmarks max
> the cpu's the ddr/llcc are scaled accordingly by it.

A kernel compilation should max out the CPU frequency on all cores.

> > And does this mean that you should stick with the uppercase "MEMLAT"
> > string after all? The firmware on my CRD is not the latest one, but I am
> > using the latest available firmware for the T14s.
> 
> We should stick with "memlat" if we run into a device in the
> wild that doesn't support "MEMLAT"

Ok. So the updated firmware supports both strings?

Johan

