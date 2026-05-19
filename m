Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87061CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeEyivkOKMiA9Q1LCcEUSrlkL6r0K7vpJgifgOOUXs8=; b=GpYOMphex9m4DvZEnqaY5RK2LR
	DW0ZOzA36K7Li99b+IMMPg6sZKe0coU2hrYEpXcro3c7Zyug2XpudZBY6ZXjHc9FIhOp9EtjWJNvy
	WdHOb8VOgS5OTZieprtSF7uQMgtd/ymH3Ad6UtJxxl0uvku5GTV1aWMVm3A6K/3dcT2lX3NTre/Se
	MDzbDXiUzSYKbjweAr2xXZnLdVPOw7R+HXj3aXvpld2NYkPPSiP+6MspGRG/5tIp0dfO97UsRA8mE
	PH581VIkFLIFUICmFpujg0wzNEcn69HYmeH673EGNtc0Wrdc2Yg1Vsn0inU+cDxFjG1TqzEUtZhLB
	tjL1ejrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFi6-00000000eNl-3qQx;
	Tue, 19 May 2026 08:21:54 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFi5-00000000e4L-0Q90
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779178913; x=1810714913;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JfhAILNls4w2wXgWnGBbGRweRyrl7ebw7UAo4Oa5uio=;
  b=Kdeq4rcyVVUihld6UPAfelalixwRM417O/360Ci4GUONkf2G8QMh/iGh
   TmIxwOgSaQirrFouVjIPzY2Hb6ds1PZU9mZ6MWBZJfWchXZTK8y//b88R
   ZP1Zs1uDVewFUWh/FJFPyaq1t65fYJd6BT0x7+lkV+r1XwFISCVaeLWp/
   lQElFXiqC6qf1UR3HYxa4VgBYTHLDTcf0Nnhd90W8wo+DHv7dXQMgYjM/
   Dhz4h9jB2Istrf9MKSnZlT9u7Pi2LAwv0Uit1yaIG2TSbOCc4EfEvFRp5
   U13X3fpZ3/jli3+B7s8V2ketfGyLA3ErKSW0Hf7r3dgwAQ6KaJ+0nzU/j
   g==;
X-CSE-ConnectionGUID: QUDNx5d7RG+P8yr4eBpLzw==
X-CSE-MsgGUID: FTM5P2W7Q3+BxX9MSejK+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79193765"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79193765"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:19:51 -0700
X-CSE-ConnectionGUID: dszkr6AhSwGwtndes+ihNQ==
X-CSE-MsgGUID: FMbhInoVSOSua/h+sMvgXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238873185"
Received: from unknown (HELO [10.102.88.45]) ([10.102.88.45])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:19:48 -0700
Message-ID: <62d6af80-62f1-4b74-b4e7-3311d319f56b@linux.intel.com>
Date: Tue, 19 May 2026 10:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and
 bindings
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
 <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
 <23203c124a158536c272d1bffb2657a0d713f8ce.camel@codeconstruct.com.au>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <23203c124a158536c272d1bffb2657a0d713f8ce.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_012153_157540_246E67CF 
X-CRM114-Status: UNSURE (   9.41  )
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

On 5/18/2026 7:02 AM, Andrew Jeffery wrote:
> 
> Sorry for the delay.
> 
> Given Krzysztof's R-b tag for patch 2 I've applied 3 (along with 1) to
> the BMC tree. Patch 2 should be picked up by Lee through the MFD tree.
> 
> Cheers,
> 
> Andrew

Hi Andrew,

Great news! Thank you.

Dawid

