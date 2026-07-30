Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF99C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2xpW+5JoduQgwgR5EIbR78H40jn/WGzYHjWvKJFybk=; b=RE8FVJ36CQ1jcYZrwKdICqKkUz
	Yr2EsjIxGgtL4C+XR8FwmYahcwDr7g9mmhK6h+k8aD7jfMMu0jcb6racW6Oct/o4OvuSlYcCjjj3s
	sulLeWTywUABwie5m8Gy5K4feMH9bBLxQmlQ5MAkv3abUx7ANVKInjxp7bYYNDa/7rTKM6jmgLadK
	7WMu5m90HCvTZVNy/munRL9X/kyVzAZaReJrCuclkvYAiUgzKtc8bYTH4KwSXpI70aI2N3nnjmdco
	GhC63neRAfHfOzBHwYzkAkTu9RJVnD2LM5M1bYM0FDLP6MQP7+8V6vXGkOWW9qLuuUGdm1gdkDAlo
	fZMhR1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNU9-0000000A77m-0kuF;
	Thu, 30 Jul 2026 09:55:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNU1-0000000A75d-48tj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:55:27 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89E281E4;
	Thu, 30 Jul 2026 11:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785405250;
	bh=MkocP/exxjWkExBkIUIx0zmhCnw4pV46V/2tv655Qx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i01e/2eGhYb90MI/TpsxOAe36iRCix9y78XYuIAArWTu/nXYgTMnO9i4wKubeSqG7
	 IBYr/j0QWKZvqLWh5R5fZJGBR0EYm84Vn648K3rD6I9upVndN0vPnpTkPeErBNh9x0
	 iz5mUhNIlfx/TlgBZ4fMRPzO4y2rfr0a8MuDQweE=
Message-ID: <a89591d4-e6eb-4622-9c2f-2e0d52733feb@ideasonboard.com>
Date: Thu, 30 Jul 2026 12:55:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] drm/tidss: Add support for DPIENABLE bit
To: Devarsh Thakkar <devarsht@ti.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
 <20260529-beagley-ai-display-v3-10-7fefdc5d1adf@ideasonboard.com>
 <4cdc9944-9486-461b-b637-702921a4367e@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <4cdc9944-9486-461b-b637-702921a4367e@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_025524_499998_80C1627F 
X-CRM114-Status: GOOD (  11.81  )
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

Hi,

On 08/07/2026 09:35, Devarsh Thakkar wrote:
> Hi,
> 
> On 29/05/26 14:15, Tomi Valkeinen wrote:
>> Many (or even all?) K3 SoCs have DSS VP_CONTROL.DPIENABLE bit described
>> in their documentation. This bit controls whether the DPI block is
>> enabled, and is set to 1 by default (i.e. DPI is enabled at HW reset).
>>
>> However, in almost all SoCs the setting does not actually do anything,
>> and at the moment the bit is not managed by the driver.
>>
>> The exception is AM62L, which does have DPIENABLE connected, and
>> disabling the DPI block when it is not in use provides power savings.
>>
>> Let's add a new feature flag for this, 'has_vp_control_dpienable', and
>> implement the support.  Disable DPIENABLE for all videoports at resume
>> time, so that it is 0 by default. Specifically enable and disable it in
>> dispc_vp_enable() and dispc_vp_disable() for DPI output.
>>
> 
> I think in commit msg you probably mean to capture dispc_vp_prepare/ 
> dispc_vp_unprepare instead of dispc_vp_enable() and dispc_vp_disable() 
> for enabling/disabling DPIENABLE bits. With that correction in commit msg,

Indeed. A left-over from an earlier version. Thanks!

  Tomi


