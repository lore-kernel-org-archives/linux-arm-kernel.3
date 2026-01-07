Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE00CF6BF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooL1wAH4oPdafpfbjqfnQTjUCj6zRNCO0crYGwQGqOo=; b=O7C9j6giombYKeB0C338zsDkPR
	h6VJnqKD0K3eCcbL2avq+Xc/IP2HiIibC0LIcS2P13ZHzNwgOd5m8mCOvo4pDnRZfQbO0b0gTsRuK
	vGvegm3jCnIbWaaaYzLrVQMplCPWJLYfq+ybfMNZ0i2RJtGHpenYlrVOhvEowpsPX1nLvlb7dXuNu
	E/bYGBQN+X6OgvqtdZndUfAycxPmzjyLLi1c3v5uWKSzjJTUNM87oSPUyShsOWHBeN5WsfOKhus0f
	uPckiax+btNiqv5DQlAs4ZquYq3/05bQaptYajXuRjt61lDxyleSBAeB3PcxOaxjCazSq8bd9Nw1N
	OlyCCBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdO8z-0000000EIcW-2JLN;
	Wed, 07 Jan 2026 07:39:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdO8x-0000000EIbd-1Y6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 07:39:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A077D436BA;
	Wed,  7 Jan 2026 07:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B250C4CEF7;
	Wed,  7 Jan 2026 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771586;
	bh=glPKfl8V1dLid4Uhk4Di9ZmvY/56MYsT7qi92tzjDvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PPbAo4iPQi8SviPCmjcUeHBWBS8QE7ieS/V5eEyLAvCvAB+kBWPvP1LplTZ1Xnflf
	 sqrXU3ULOiKZzqkETrLidsidrMEFWSxooIL3alcVfdFkLh3CIWe4K8suzrnxVBEGAY
	 Od6Mq0DXs+74pMgYgLePQYdREGlsF3drtjjvrD/9xRuOfJ4wvf+mF9KrDjHQ3QRK5k
	 2m917ZpmvD+Ko++w6oW0awrzcfOxVH9/f4PDywk4q8r6WK+B3Q41XhsKtTkxF/Li/U
	 lc9ZL07XWb4XEdTJRgGanFOnJCy3VoDY9oolxslROmuRc1MRH3UKs+WwLDiYEcllCX
	 vJSOWZCdBTPiw==
Message-ID: <a65f4add-f052-4c51-85e9-317b42802df1@kernel.org>
Date: Wed, 7 Jan 2026 08:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: fsl-mc: add missing fsl_mc_bus_dpdbg_type
 declaration
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
 <2026010755-registrar-agreeably-a626@gregkh>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <2026010755-registrar-agreeably-a626@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_233947_452681_9DD55D4C 
X-CRM114-Status: GOOD (  15.45  )
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

Hi Ioana,

Le 07/01/2026 à 06:30, Greg Kroah-Hartman a écrit :
> On Tue, Jan 06, 2026 at 07:54:21PM +0100, Christophe Leroy (CS GROUP) wrote:
>> Fix following sparse warning:
>>
>>    CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
>> drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?
>>
>> As it is exported it can't be static. So declare it in mc.h like
>> all other similar objects.
>>
>> Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> ---
>>   include/linux/fsl/mc.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
>> index 897d6211c1635..28441a456bb48 100644
>> --- a/include/linux/fsl/mc.h
>> +++ b/include/linux/fsl/mc.h
>> @@ -451,6 +451,7 @@ extern const struct device_type fsl_mc_bus_dpdcei_type;
>>   extern const struct device_type fsl_mc_bus_dpaiop_type;
>>   extern const struct device_type fsl_mc_bus_dpci_type;
>>   extern const struct device_type fsl_mc_bus_dpdmai_type;
>> +extern const struct device_type fsl_mc_bus_dpdbg_type;
> 
> As it's obviously not used anywhere, this should not be the fix, please
> just mark it static and remove the EXPORT_SYMBOL_GPL() as well.

What's your opinion here as Maintainer of this driver, what should we do ?

Greg is right that it is nowhere used, and it is the same for several 
other types, the only difference being that they have a matching 
is_fsl_mc_bus_dp..() helper that hides the type, but not all helpers are 
used, and many of them are not used outside drivers/bus/fsl-mc/ which 
cannot be built as a module:

$ git grep is_fsl_mc_bus_
drivers/bus/fsl-mc/dprc-driver.c:       if (!is_fsl_mc_bus_dprc(mc_dev))
drivers/bus/fsl-mc/dprc-driver.c:       if (!is_fsl_mc_bus_dprc(mc_dev))
drivers/bus/fsl-mc/fsl-mc-allocator.c:  return is_fsl_mc_bus_dpbp(mc_dev) ||
drivers/bus/fsl-mc/fsl-mc-allocator.c: 
is_fsl_mc_bus_dpmcp(mc_dev) ||
drivers/bus/fsl-mc/fsl-mc-allocator.c:         is_fsl_mc_bus_dpcon(mc_dev);
drivers/bus/fsl-mc/fsl-mc-allocator.c:  if (is_fsl_mc_bus_dprc(mc_dev))
drivers/bus/fsl-mc/fsl-mc-allocator.c:  if (is_fsl_mc_bus_dprc(mc_dev))
drivers/bus/fsl-mc/fsl-mc-bus.c:        if (is_fsl_mc_bus_dprc(mc_dev) ||
drivers/bus/fsl-mc/fsl-mc-bus.c:            is_fsl_mc_bus_dpmcp(mc_dev)) {
drivers/bus/fsl-mc/fsl-mc-bus.c:        } else if 
(is_fsl_mc_bus_dpio(mc_dev)) {
drivers/bus/fsl-mc/fsl-mc-bus.c:                        if 
(is_fsl_mc_bus_dprc(mc_dev) &&
drivers/bus/fsl-mc/fsl-mc-bus.c:        if (is_fsl_mc_bus_dprc(mc_dev))
drivers/vfio/fsl-mc/vfio_fsl_mc.c:              int no_mmap = 
is_fsl_mc_bus_dprc(mc_dev);
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if 
(is_fsl_mc_bus_dprc(vdev->mc_dev)) {
drivers/vfio/fsl-mc/vfio_fsl_mc.c:              if 
(is_fsl_mc_bus_dprc(mc_dev))
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if (!is_fsl_mc_bus_dprc(mc_dev)) {
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if (!is_fsl_mc_bus_dprc(mc_dev))
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if (!is_fsl_mc_bus_dprc(mc_dev))
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      if (is_fsl_mc_bus_dprc(mc_dev))
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dprc(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpni(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpio(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpsw(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpdmux(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpbp(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpcon(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpmcp(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpmac(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dprtc(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpseci(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpdcei(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpaiop(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpci(const 
struct fsl_mc_device *mc_dev)
include/linux/fsl/mc.h:static inline bool is_fsl_mc_bus_dpdmai(const 
struct fsl_mc_device *mc_dev)

And the only outside user is drivers/vfio/fsl-mc/vfio_fsl_mc.c which can 
be a module, but has been orphaned by commit af6605f87ca5 ("MAINTAINERS: 
Orphan vfio fsl-mc bus driver") and scheduled for removal by commit 
1b1d9ca13475 ("vfio/fsl-mc: Mark for removal")

Christophe

