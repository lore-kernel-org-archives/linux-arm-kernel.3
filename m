Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B45DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdMneNMiWUU5nbWg4PpeDhEraN2dp4d46EBa1DqoXcs=; b=rM+pVTeV09T5mriPzguK+2tm/R
	0nXcUGrpyFhrjjA7FV259PjrYjYOL7yBn4rd4bc4aPfEXh/6pEYGN1o+5vcJrNgjLK++O6kxZW15Y
	QXFtfXmZBAD2dxun6fY7XvljIyjMQXAjafuSJWZ3Mkf+TdlNmsuUo01b9WJcwTRWJNu8Zojqsji5B
	NMz+EKCDVtbD4jS44OX6WfO1oIySCEqF7xsBSdpjncXM/V5Ssmw2NWll62wZuje2I6uYjLFCce0UI
	Fs9IYhOenqJsXGEVNzQ1z17Pv3D8m4uzvPz5kMDekp903biLzsKUCzlsQqMPAVwlj6vgT58XZdCJb
	ey3zWyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPvB-0000000F0zF-16n5;
	Thu, 16 Jan 2025 13:28:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPtu-0000000F0ZJ-3ci8;
	Thu, 16 Jan 2025 13:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737034029;
	bh=CO6WZPYdeZC8+Bx0ho5URccoE4ccASaq/bcedaSPINk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=doa6shUHNfIEHjEAqGxGeNydvwDIsM1DBvzqdtwPGDCSR34OXuitDO+D0BSeQ2Rqt
	 W9MVXML8f3pjH7YJCaXHs65OgRAOlA3Xwu+tEKOGWrZIMb/qLbCbN0PfaNsCSIhTKS
	 OfyB55kluekPg1CI9bdfN6AB9eqsWfqdgMHRecFtShYQDb5W+mH7D3b8d1zoHBg/Vy
	 eN/OWG7kPrF+ditoeDRg4zC5K+JaiSZljxdOotELYC/wvbAoG1DQci3XSrOxopF67G
	 e0UT5+nAUv00teiH5IQJS4oUGyZWqkqCtPpgYWzqTAGQScsfZfv5RqbHEt8+JQAVFX
	 +3/Xu0o3qQ7sA==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2CAE817E0E9E;
	Thu, 16 Jan 2025 14:27:02 +0100 (CET)
Date: Thu, 16 Jan 2025 10:27:00 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>, kernel@collabora.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/5] thermal/drivers/mediatek/lvts: Disable
 Stage 3 thermal threshold
Message-ID: <a61835ca-a13d-4547-b3a2-3563688bff25@notapiano>
References: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
 <20250113-mt8192-lvts-filtered-suspend-fix-v2-2-07a25200c7c6@collabora.com>
 <53f3803f-c6ef-40db-9794-6c90b37659c1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53f3803f-c6ef-40db-9794-6c90b37659c1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_052711_051421_65320011 
X-CRM114-Status: GOOD (  22.48  )
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

On Tue, Jan 14, 2025 at 12:54:43PM +0100, Daniel Lezcano wrote:
> On 13/01/2025 14:27, Nícolas F. R. A. Prado wrote:
> > The Stage 3 thermal threshold is currently configured during
> > the controller initialization to 105 Celsius. From the kernel
> > perspective, this configuration is harmful because:
> > * The stage 3 interrupt that gets triggered when the threshold is
> >    crossed is not handled in any way by the IRQ handler, it just gets
> >    cleared. Besides, the temperature used for stage 3 comes from the
> >    sensors, and the critical thermal trip points described in the
> >    Devicetree will already cause a shutdown when crossed (at a lower
> >    temperature, of 100 Celsius, for all SoCs currently using this
> >    driver).
> > * The only effect of crossing the stage 3 threshold that has been
> >    observed is that it causes the machine to no longer be able to enter
> >    suspend. Even if that was a result of a momentary glitch in the
> >    temperature reading of a sensor (as has been observed on the
> >    MT8192-based Chromebooks).
> > 
> > For those reasons, disable the Stage 3 thermal threshold configuration.
> 
> Does this stage 3 not designed to reset the system ? So the interrupt line
> should be attached to the reset line ? (just asking)

Yes, my guess is that the intention of stage 3 is to cause a system reset,
however it clearly does not cause a system reset, so it is not directly
connected to the reset line in any way. Instead it is up to the kernel to
receive the interrupt and deal with it. But then, since there are lower thermal
thresholds that already cause a system shutdown, it's useless to keep this
around - it only causes suspend/resume misbehaviors in case there are spurious
readings.

Thanks,
Nícolas

