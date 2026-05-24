Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEAACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 23:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UufSwSgpRgsAqIYOsS0l8pXjHiLkYpufOZ9F11/DJSA=; b=ma9T8FYHwAXdRhb0llIWl7nRTH
	QeLQ68Vj4X5nZINrFGQdlN+T6cDTzmvgbVAXkN1e5ONChu7lsmPFU+KWncKeVO4kUjyx/Gs7W4F/9
	wOmYUzWRlFeRVrN3C3pkgDmRbl+04lRP3JQyJ9jQtOhT6ixIFqJY8eIEQpGlb9BOkJJcQpK8z0Qw/
	Mf9Vk5BtM1Cg4r2ZpWxWBT8g0JS5DTo4NdTll8SMbooB1//aM8yFSKZiU73A/sjkX8cY2BD5mcyAC
	A0tJgM2KTx5NaEI1/52ZOmKN4NMkMQZQs2D9jaLcPliMx9HX0jGAkXjZ97xIBMZt4ju0SqigYrlIn
	wcHMUJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHc4-0000000FnSB-20TJ;
	Sun, 24 May 2026 22:48:04 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHc3-0000000FnRw-0sHy;
	Sun, 24 May 2026 22:48:03 +0000
Message-ID: <d7cd7bb3-520f-4e80-8242-583f689f60db@infradead.org>
Date: Sun, 24 May 2026 15:48:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: ABI: sysfs-class-reboot-mode-reboot_modes:
 fix doc warnings
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260426232705.422938-1-rdunlap@infradead.org>
 <CAMRc=McUr8Tuv9+LNQ0=ufj1z4Tstp_ujmL=r7bXrLaBXg4E5g@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAMRc=McUr8Tuv9+LNQ0=ufj1z4Tstp_ujmL=r7bXrLaBXg4E5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Sebastian,

On 4/27/26 2:11 AM, Bartosz Golaszewski wrote:
> On Mon, 27 Apr 2026 01:27:05 +0200, Randy Dunlap <rdunlap@infradead.org> said:
>> Repair the docs build warnings in this file by unindenting the description,
>> adding blank lines, and using `` to quote *arg.
>>
>> WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
>> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
>>
>> Fixes: d3da03025e6d ("Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

This build warning is now in mainline.
Will you be merging this patch soon?

thanks.
-- 
~Randy


