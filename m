Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666C8C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVpY0QdMZagNwCSf9WSV5CJ0QRaVBkcNO3sPmXuEHFY=; b=CIsEaNIa3a/7S7tR8+tK831Tet
	xSSwLD75PJwES5HA/WmnSIsYdJdCYTGKP/U5AbDDiuoIBAHX0+t+fp6tsw0ckQu4uH7pOKF7mJT5X
	UP3rqsMCuBnvFgqyzIYET6EZf3DQ/BntlN0JYUMdASQceUZCCTfa3bfZcRbQsMb5X/VkvkBcpAAOU
	4ZY6bxH7U6MQozEU7vjrqIM6lq1DGxl9sHJ6B0p9dHl6rzqC+WcmfJcaGdv+UA2UJ6s9YTDcB4Zm5
	YnTENVlBTF1DdHmXzsW7tFGIb0mdi8PllMG2QZ50On17pTEzOVLlES2U4hqB1k66m219sxvdR1YFu
	IaOVo3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lcl-00000003qha-27u2;
	Sat, 05 Sep 2026 08:19:43 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lci-00000003qgv-1MjG;
	Sat, 05 Sep 2026 08:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788596380; x=1820132380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LCxtwuf2XVjyavMFXpabUkNGnxhVmscqDbsgQpznjPQ=;
  b=SCoHbv4cIPSWLx8hBOh/o/Ow7/pOnjpRw6JRvk20UmxMPu2AjTf8R680
   gNuTsxQICpm9wEhp4PvsjBjAq/VuANs3D08XIxpzuce+2KulCfrU7cg7T
   7dbiUtC+FEn7EkWIs2K8Th8mIC6KFM00QAYpPqx9HZNSDWK4lVDpjucbk
   Eun3d0q0JvEoMSkWPsDDp8PlNwTq+vfr1k6U1tVAipK52jvnbVX1ir+jE
   Mf2nGyKGghEREHbis142amEwAu4H9o1xHYLKnvftpA51Cu3fAh1IjsfTx
   2dH+0vmYCkG9sgQpOF7U273gvOVHxeLfdqmxMaBSq704hg3jeMnZM+lit
   Q==;
X-CSE-ConnectionGUID: /qnZpArESnq8Z0cDgBiLgg==
X-CSE-MsgGUID: enx/aLRqQYeRbT3zqvDV+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99682607"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="99682607"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:19:39 -0700
X-CSE-ConnectionGUID: RZJD/lMbRdmRSuPG8lpbEA==
X-CSE-MsgGUID: cq+DJsyETMOKDJXUoiwqxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="295128198"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:19:34 -0700
Date: Sat, 5 Sep 2026 11:19:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <apvQlBEgHOW9MCxN@ashevche-desk.local>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
 <2026090430-botanist-ungodly-0299@gregkh>
 <CAGb2v65MSxL+r+wqMjPKVSh9aS1gkn8og6oBinSXDdipnoOyCQ@mail.gmail.com>
 <2026090433-chair-tidings-5c99@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026090433-chair-tidings-5c99@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_011940_374656_8437B6BB 
X-CRM114-Status: GOOD (  18.59  )
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

On Fri, Sep 04, 2026 at 07:52:37PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Sep 05, 2026 at 01:24:20AM +0800, Chen-Yu Tsai wrote:
> > On Sat, Sep 5, 2026 at 12:47 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> > > > |struct usb_port| and its matching container_of() macro should live in
> > > > its own port.h, matching the split we have for .c files.
> > >
> > > Why?
> > 
> > This was requested by Andy. And to me it sort of made sense.
> > 
> > > > Move them as described. Also move usb_port_is_power_on(), since in the
> > > > next change its |struct usb_hub *| parameter will be changed to
> > > > |struct usb_port *|, and becomes a non-static function that only
> > > > references |struct usb_port|.
> > >
> > > No, please don't do that unless you have a really good reason.
> > 
> > Which part? Move the code?
> 
> Please don't make a new .h file.
> 
> Moving the function might make sense on its own if you need it in a
> different file later on, but do a move only, and then change things if
> you really need to do that.

Isn't this file to break possible circular dependencies?

-- 
With Best Regards,
Andy Shevchenko



