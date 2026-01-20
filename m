Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F825D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKclJrh3YWKAYo07aofy0yXL8sW8TUFHMV+vRCcvDbQ=; b=4A7CfsmHAfDXSZX95IbfRdH0zJ
	kDEcUUSpwdfXOV3/em9Bz+ogpYOzC/RhahYofaYHuStw2odR8NOxc4C2PAdbKCYz3SXvObEjpjoFg
	v29Tlw8OHiHaOvzzrhQnSTZ8Evnm0ciC9uWi0ri/iXXln28WqjNcb5x2m3vPVoZtfScrwsEmksgUc
	Q+1sI1CXEw+KXptDJRJJgQq31ULXwPG49psagzsJZ7oZ+mswfqKxx3tJpOdmIOvuX8zhYg8rkUMvu
	cL8sAMBm0Aczl/mRgudLUzu78WzNefiKd0/GpcWzMQAwDts++3Cty14Me3Sj3lmiSgX3lYvDYEoDN
	+Jh1plPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDF2-000000042h7-0hOI;
	Tue, 20 Jan 2026 15:02:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDEz-000000042gB-413o;
	Tue, 20 Jan 2026 15:01:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF0BD40584;
	Tue, 20 Jan 2026 15:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768D6C16AAE;
	Tue, 20 Jan 2026 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768921316;
	bh=hGTUlmiLRnAbmX/IerIdVQBrE4kuY4fnoHuaZq1QnTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bE1soNsl6YvccJ2CNmIjbB5//j82Y+x5UmRSnX0dTb9Z4dTIrzraszPURYX7+mcY6
	 rO7wZEaj59ys0aoWe/0uWdVpJ8pvx8OR/az4Eu8gNWkjOWiQF2ZkyHafSMPxZvbxYe
	 QXqna34zB2FN49db5UVwEjWrNUC9EvqDr4TuFn772Fqu4z//JpJCPy0PvtemdeM375
	 FWt9ppg1hGhPrv3Mq4Pn689SR0E7NkQr+EEYxY0MJEnxeKDB9jLbgK9xi9a6m+kInj
	 XRizz5OIRaXBZLJq4ned+KeE9RZ0je69pzFpjIXIqo5ZYLrXarvq63Wl7RIG3AMUNs
	 t7y739DuG3u+A==
Date: Tue, 20 Jan 2026 15:01:51 +0000
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
Message-ID: <20260120150151.GE1354723@google.com>
References: <20260112124351.17707-1-chenjh@rock-chips.com>
 <176892124246.2259507.3674990175192687595.b4-ty@kernel.org>
 <20260120150119.GD1354723@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120150119.GD1354723@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_070158_014744_4668CD84 
X-CRM114-Status: GOOD (  15.65  )
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

> On Tue, 20 Jan 2026, Lee Jones wrote:
> 
> > On Mon, 12 Jan 2026 20:43:48 +0800, Joseph Chen wrote:
> > > This patch series adds support for the Rockchip RK801 Power Management
> > > Integrated Circuit (PMIC) to the Linux kernel.
> > > 
> > > The RK801 is a PMIC designed for multimedia and handheld devices. It
> > > includes:
> > > - 4 BUCK regulators (DCDC)
> > > - 2 LDO regulators
> > > - 1 SWITCH regulator
> > > - Interrupt support for power key events
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/3] dt-bindings: mfd: Add rk801 binding
> >       commit: a8a2add7b1889f00bc5d2b1f25fad34e89ef85fb
> > [2/3] mfd: rk8xx: Add RK801 support
> >       commit: 156442eb6e44d545f09559bd70c5b31fba39eb01
> > [3/3] regulator: rk808: Add RK801 support
> >       commit: 3e10bbd9c8a6d5d016b8e52c5d4ceba93a2304a0
> 
> Note to self: ib-mfd-regulator-6.20

Note to everyone else: Pull-request to follow after build testing.

-- 
Lee Jones [李琼斯]

