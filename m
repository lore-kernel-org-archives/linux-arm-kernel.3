Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B74C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SG0ZVUMFVgj5Gf4mc8He5lD30q/TXKbKL6CBMa//iA=; b=NH3AYYWogS8+3Qb8dC44gxQp/z
	WkdX2WzwxJcC09VKlwKMQ96PABAmDs3OmiLj4i2wH7QZFJpuswGKngg8lnUsOXi1bYiciXSCx1Qgz
	HZ1zc+r6K8w7FQlo23M1ycJNWU6BRgi98q7F/rT7oAvwPU67krORp1nsL2otqk9TL4mpeL+XnAWVD
	3nzVjvJsp9WbSLu6fxg9Ibw91GsNVp80MeVgNRRKzUZz8dRF7wmNc0/pov5aUnL8JrJuqy8xGZAF6
	75JIbIjhaiXlcUxRMTse6+lYpiwrLYwkmXBdC0vT9dpeDDZCTQxIZgDGZkeY7iMZINzsatnjifgKR
	y+ZW5/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvxk-0000000EKYw-0abL;
	Wed, 15 Jul 2026 09:31:32 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvxh-0000000EKYI-0ngq;
	Wed, 15 Jul 2026 09:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784107889; x=1815643889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k4Mxr2b2uXcaPiH3l9mMz8keQUEPR+TLeMo54YK8SQg=;
  b=QXDixnB7ZmLcTwlsRqgC5uk5FBZbZ38YGCX/lWlIs90nRV+ZEJrYhQfK
   Z9e9rNt8u/ujJZWzU8Ep16ta0Z/3FE3qLoQ8Qh64UlZP9YAmPxtiil3//
   4P1U89YKv0x61/tXmPIJTnO3vMgDXsGuxFBNZ11KjaImW6UOj99l9Kk26
   pD/z3wjp3yC6pvJvfSVTwZpS3XJUztl16Gq6CIsxANvPrvPNnRiknmnnI
   i+1G4VUdBbFi/Bsh0f88jj62Ib3+vHkRdXOPDq6AjUFPRbTECXTeNPVO8
   k+GQYEvDbzgddicwIB1SBzYQJa69nZnBpHlok48aXpc96cMf3oz/rmTju
   A==;
X-CSE-ConnectionGUID: GploUfJDTc+2KNWL6m80yg==
X-CSE-MsgGUID: TKJLZ2KPRQaPhg2ObzJTUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84621804"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84621804"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:31:27 -0700
X-CSE-ConnectionGUID: C6gWwrZiQoSdjr4Qi+bgqQ==
X-CSE-MsgGUID: rexS2BC5TTm8ipg2rVuMgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="255007837"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:31:22 -0700
Date: Wed, 15 Jul 2026 12:31:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <aldTZ3ni4Uk3eTO8@ashevche-desk.local>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715085348.3457359-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_023129_242036_D0283FFB 
X-CRM114-Status: GOOD (  15.63  )
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

On Wed, Jul 15, 2026 at 04:53:37PM +0800, Chen-Yu Tsai wrote:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
> 
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
> 
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
> 
> Also drop 'extern' from the header declaration of usb_port_is_power_on().
> This is not needed in modern C.

...

> +struct usb_port {
> +	struct usb_device *child;
> +	struct device dev;
> +	struct usb_dev_state *port_owner;
> +	struct usb_port *peer;
> +	struct typec_connector *connector;
> +	struct dev_pm_qos_request *req;
> +	enum usb_port_connect_type connect_type;
> +	enum usb_device_state state;
> +	struct kernfs_node *state_kn;
> +	usb_port_location_t location;
> +	struct mutex status_lock;
> +	u32 over_current_count;
> +	u8 portnum;
> +	u32 quirks;
> +	unsigned int early_stop:1;
> +	unsigned int ignore_event:1;
> +	unsigned int is_superspeed:1;
> +	unsigned int usb3_lpm_u1_permit:1;
> +	unsigned int usb3_lpm_u2_permit:1;
> +};

A side note for the future development (no need to change anything here
right now). It might be that the layout is suboptimal and `pahole` might
propose a better one.

-- 
With Best Regards,
Andy Shevchenko



