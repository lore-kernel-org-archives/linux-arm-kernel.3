Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACA8C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z433KB4L93cnRYjQlviC5dX4/2p8fE9P0yvAjHPzt5s=; b=wcoJdIG0PxJbuIjfjy4sEVO7qS
	KdIWzJl055A9IVkxQ8lSqeh64tyt8gqrNSODvvZnUzO556d040oxnyri4ImqA4CMHySLrPCo0gO/x
	CZx3UO0XyvoqbgoNLSAuMa58Lh3FQZhCISwQMKeVuKXU/7cAFIHWeMndcgYUV/UyE0U+j2bVre8qQ
	3+zNcINFcwzOmn2NsFMCMae2MwAYQNcJlCPLRaJdRMSMZKIh8D/TFpYGx9kjJvssErZxZiPMTfGec
	oFMtoi5K+tdZfiqDxl1Yd+j1SrpZIAtfMDocItMU4FQvudDP31FPtFdhdxPCznqBsN0sbg5bLGD45
	u9ZT95wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2uw-00000009NRx-1IvC;
	Wed, 02 Jul 2025 19:14:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Yc-00000009KD6-0m9K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99C73A5312F;
	Wed,  2 Jul 2025 18:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6149EC4CEE7;
	Wed,  2 Jul 2025 18:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482304;
	bh=sqoKSQgNKzhlKYTNHTQq13ghy76tijVc8KUVW4KAgik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S+yHVcuvWoA3Y5hiMksVslUu/0J6tIA/5AyUFptJNDG+NcBxNkBhYk7fPUgaQ7hbO
	 vrGzcDVWzQQGwIrTuzsI+veg4AcUP5Nlhf0xZZvMFwsUuslWodtewAuZWY4bAe0k4G
	 bk3OjcQ/SlzLgRABRG6slWx7F7N37jHWmC1hTMmgCYIrPV6uskA5QfhFzaem4HnMOj
	 lFyo+X3puFm5TBem9Ms8LAoCT+P3Lt45UART7hLjbcBKGgoQXIMnBiYqeoeFCnOoZA
	 w84MqFP9RmNXa8HNiArAWSbGM7MjhGSLho9w1oELVQ7lTlDKINLjO4FbKo50USWx8Y
	 +KYGOOHefl8Fw==
Message-ID: <da8ada90-499f-41dc-808b-260d7a9229d3@kernel.org>
Date: Wed, 2 Jul 2025 20:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Rob Herring <robh@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-3-herve.codina@bootlin.com>
 <20250627141846.GA3234475-robh@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250627141846.GA3234475-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_115146_373577_563D8AF9 
X-CRM114-Status: GOOD (  17.92  )
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

On 6/27/25 4:18 PM, Rob Herring wrote:
> On Fri, Jun 13, 2025 at 03:47:42PM +0200, Herve Codina wrote:
>> get_dev_from_fwnode() calls get_device() and so it acquires a reference
>> on the device returned.
>>
>> In order to be more obvious that this wrapper is a get_device() variant,
>> rename it to get_device_from_fwnode().
>>
>> Suggested-by: Mark Brown <broonie@kernel.org>
>> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com/
>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Reviewed-by: Saravana Kannan <saravanak@google.com>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>   drivers/base/core.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> index cbc0099d8ef2..36ccee91ba9a 100644
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
>> @@ -1881,7 +1881,7 @@ static void fw_devlink_unblock_consumers(struct device *dev)
>>   	device_links_write_unlock();
>>   }
>>   
>> -#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
>> +#define get_device_from_fwnode(fwnode)	get_device((fwnode)->dev)
> 
> In patch 3, you add the same define. Is there some reason to not move it
> to a header?

AFAIK, the struct device pointer in struct fwnode_handle is not backed by a
reference count, which means that it's the callers responsibility to ensure that
it's guaranteed that the pointer in struct fwnode_handle is still valid.

Besides some driver-core internals the pointer shouldn't be used, and hence this
helper shouldn't be available through a public header.

