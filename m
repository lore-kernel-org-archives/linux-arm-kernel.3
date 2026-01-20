Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDB4D2ED12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/JeiPcQQ9FR5ba0zSjc9N1PZ2u7hEj05ykYANOfBNI=; b=Zv672Q7qGjoXA1yT9P3xuyYSs7
	rTXhifwyT0rBT73ldFrjpOJDpVd9CLNejLZOjrBppuNOT+4D8ME/R3TyV+L/NRKvDpR0tVZSdOG6U
	suPuBQhENWLsFWmlpVovO2/h0GTjOcSTc8In8rnI7fcrcUDXPTK1Zxdg5jNH6MirQnnwaVn9dTzqU
	jwrvobYEhwPG2pB9YglTDmQdp3tsVfRbngdX9tgmBjFTHqiaNMriSETJu4LKMo0B43ukCmM8242sn
	jSRA72xkQVHUVwjpBcoFvQDqnbHCSQPvaLKPKioDJB/irxiNvBnhPNih8TKGvMQAkvLDlt6jbtoc3
	T2f2YCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDEX-000000042Ye-0FJT;
	Tue, 20 Jan 2026 15:01:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDET-000000042Xi-3e7p;
	Tue, 20 Jan 2026 15:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FA55409A9;
	Tue, 20 Jan 2026 15:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1C6C16AAE;
	Tue, 20 Jan 2026 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768921284;
	bh=MUgQ3sNT7KzrFdWSi0ndT2SjkT6Egmpv2leIk7amRZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fc+DFmIePyPT2n439mESB/oPRZB+EkK74yybwlMoDoJpkgWTESDQDCmZFDl/okVDM
	 aQM/Ua9/JjMM1zeegWbHcqPTNnBEt+7oB+0HwOXYnE6ivzUmBfjS0KuejlQ03CKitC
	 JE2635mEhy3o+CXYEMSZIgr03Vj0V9cikFkCJxKuAY775TJfHOdMHISrl3KfCtnK96
	 17ZwnUe3eVgAzhXVT8f+FbRV9jebjbuAhTBilp5j5WIq55965Nlhgsv50yDwhs4SIH
	 znc7W3xHT201qJ3VG7wLxfkRYYnxPi8meyyp13r/yEOv1zXNEXdb4XTyvIpwrrLHIt
	 87ryY0kdxafBA==
Date: Tue, 20 Jan 2026 15:01:19 +0000
From: Lee Jones <lee@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Joseph Chen <chenjh@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Add RK801 PMIC support
Message-ID: <20260120150119.GD1354723@google.com>
References: <20260112124351.17707-1-chenjh@rock-chips.com>
 <176892124246.2259507.3674990175192687595.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176892124246.2259507.3674990175192687595.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_070125_923721_0DA74577 
X-CRM114-Status: GOOD (  14.63  )
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

On Tue, 20 Jan 2026, Lee Jones wrote:

> On Mon, 12 Jan 2026 20:43:48 +0800, Joseph Chen wrote:
> > This patch series adds support for the Rockchip RK801 Power Management
> > Integrated Circuit (PMIC) to the Linux kernel.
> > 
> > The RK801 is a PMIC designed for multimedia and handheld devices. It
> > includes:
> > - 4 BUCK regulators (DCDC)
> > - 2 LDO regulators
> > - 1 SWITCH regulator
> > - Interrupt support for power key events
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: mfd: Add rk801 binding
>       commit: a8a2add7b1889f00bc5d2b1f25fad34e89ef85fb
> [2/3] mfd: rk8xx: Add RK801 support
>       commit: 156442eb6e44d545f09559bd70c5b31fba39eb01
> [3/3] regulator: rk808: Add RK801 support
>       commit: 3e10bbd9c8a6d5d016b8e52c5d4ceba93a2304a0

Note to self: ib-mfd-regulator-6.20

-- 
Lee Jones [李琼斯]

