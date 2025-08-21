Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3705CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se5i0gKbUrWCIYSdrKXdLZXGNqrXLN6XmUsxzvt8S+U=; b=tYb8xT0ofHAFo0kqau2zU2rZ7X
	LP6P6chEowkQpewtuImaTjkf/2KXm/ACZygTPOuVd26vDsexC8wv7K5lWOBeGNgtesVDz8Kg6awza
	i8BJ6UPcS3XSSSv8oaNDoYwkh0gdjRWUQF9IBI6dt7Vi15QwwLVKaaJefwW1NTO5H6ggYJp5/s9WP
	VVYDwH2kQ8WfKlaiLIuaHL9sufi/2G+CyzUXeIUzYClmClG4Jv7/XnkEpQVkdOp6yRqSnwDTR0Nmz
	ZUXfLa+AshYQZsSCQDWny3I0FBDfZ0A2GW9lcXX9yhEQ8thuPjmwrFfj6yP2OUR1ZpqMPgs4fRSvh
	/o61PZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2cp-0000000GdFO-1Y7z;
	Thu, 21 Aug 2025 10:34:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0od-0000000GHMm-1y73
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:38:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9F2168F;
	Thu, 21 Aug 2025 01:38:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5D673F63F;
	Thu, 21 Aug 2025 01:38:32 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:38:30 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
Message-ID: <aKbbBrFkTNuRArcN@pluto>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_013835_545385_0D89D459 
X-CRM114-Status: UNSURE (   8.92  )
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

On Sun, Jul 20, 2025 at 02:38:59PM -0500, Dan Carpenter wrote:
> In SCMI the value of the pin is just another configuration option.  Add
> this as an option in the pin_config_param enum and creating a mapping to
> SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()

If this is the case, should not this commit have also a Fixes tag ?

Cheers,
Cristian

