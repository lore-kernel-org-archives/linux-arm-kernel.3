Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECBFCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cPnc2HBwlXfOQHf4P6mq2XSBykV+yW2Sb/oJ4JFuHQ=; b=LzbNWTlkHwSsT/mrRSq+fp2keD
	CBwF/W2tLr1QX4iJvNPTYPyepfyrue4PMyzYECE1ExJEaRi75wz4NAFjrVRUVTmawYwDArgje+2yc
	7qFp5TIojQllYcaKOUyXqteGHNRpIiz+13Ac6PlzZNgoWYHn3p4NOtaL3PIzZU+5uLofuvJ1EFRE9
	gMZs3LJORu6Dn1e5YOAN29qAXqsO35ydlknocoCfbsfq/muFiUBPrEJ/vGmqTvynBzswx0H/L6aQ5
	+LMaySPLwvSv8q0K4++7/ZE/j5+Ty9sRftePPTXDMK0t7IhtzmjTI8Yjeulx/3KnTPDcnIlw5QrJ7
	ghW0+UqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoI2-00000001YC8-3cOp;
	Tue, 26 May 2026 09:41:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoI1-00000001YBu-2TLn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:41:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C504B60018;
	Tue, 26 May 2026 09:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F77F1F000E9;
	Tue, 26 May 2026 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788492;
	bh=1cPnc2HBwlXfOQHf4P6mq2XSBykV+yW2Sb/oJ4JFuHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IHS2tBhCEydy2L07hJTcjM2HawQ0ovbNQl+hx4PVNB71ZoA4rTE3d7lLKy9yIRyIu
	 94wJnUs5fypXA1knSNnpU6ScReOv1Cms6BmxmsUyf46hOfqGrbl5srN+zUcsLGJd8n
	 3lhLvDF+2+rgiwlfPw3lbIWelm1siCxGBWv0+R5vn7UepsFhGsHCwfca70VLpAPJ9B
	 TXyzPQbD2hj21Rdz94XxI1F8rpVRMzD66kWE4TTkYUmpgoVVBE11fQUFNvTJWZJFxv
	 rzgJHG0HviKrOetFrQpWZ4KSQ2kT812y1ppJNnmxiJp3LJNdNz2RwTYMxmj2ML1N+P
	 JjkSSUTNGAKsw==
Date: Tue, 26 May 2026 10:41:29 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH 2/4] firmware: arm_ffa: Register core as a platform driver
Message-ID: <20260526-ancient-bulky-numbat-915f10@sudeepholla>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
 <20260508-b4-ffa_plat_dev-v1-2-c5a30f8cf7b8@kernel.org>
 <20260523001148.GA1319283@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523001148.GA1319283@ax162>
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

On Fri, May 22, 2026 at 05:11:48PM -0700, Nathan Chancellor wrote:
> Hi Sudeep,
> 
> On Fri, May 08, 2026 at 06:54:16PM +0100, Sudeep Holla wrote:
> > Move the FF-A core bring-up and teardown paths into platform driver
> > probe and remove callbacks, and register a synthetic arm-ffa platform
> > device to bind the driver.
> > 
> > This makes the FF-A core lifetime follow the driver model while keeping
> > the device creation internal to the FF-A core. Use normal platform driver
> > registration so the probe path has standard driver-core semantics.
> > 
> > The synthetic platform device is a temporary bridge until ACPI and
> > devicetree describe the FF-A core device or object. Once those firmware
> > description paths are defined, the internal platform device creation can
> > be dropped and the driver can bind to the firmware-described device
> > directly.
> > 
> > Since the transport selection now happens from the platform probe path,
> > drop the __init annotation from ffa_transport_init().
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> I am seeing
> 
>   arm-ffa arm-ffa: probe with driver arm-ffa failed with error -95
> 
> on my two arm64 test machines after this change landed in -next as
> commit e659fc8e537c ("firmware: arm_ffa: Register core as a platform
> driver"), is this expected? If so, perhaps it should be silenced?
> 

Yes it should be silenced, I will see how it can be done. Thanks for the
report.

-- 
Regards,
Sudeep

