Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445A0D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=; b=tg9wDZGL33njKulhP6A1Ew3eU2
	FbGm1j4x/fYK4e/PE29aYx4dojObsMix450WZ+p59dsxf5vzHutFDRLjDKkFaFPjYh7B+Lf+W47+L
	D0GRCGIVcvwyXw4A3zGvuhsoT2OsrHXg/HwsVn82OMeV3uOmi4Pp33YcGNDYYMldn9ih7Y1676+Y3
	jfDrq6ZKdOE6pvn48y8C1vRDUqAbwcGw82BTweLgx3hNGUfSFwrH83SVgvGAFKsqhDXCel3l+/fph
	GbwhZWHaj2xGrrjL5QXGMXOOEWJkrYm/kaT8AiWNt1bYFyPl23iBVVBhmVbOfa525t5ZWfIx+ZCxU
	1m4piFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NMY-0000000ATFd-2Zm5;
	Mon, 28 Oct 2024 10:52:42 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NJg-0000000AScA-2s83;
	Mon, 28 Oct 2024 10:49:46 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5cbb719839eso3706264a12.2;
        Mon, 28 Oct 2024 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730112582; x=1730717382; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=;
        b=CiRm2cRaLIY8yXwQhOWdqcJ6m0RYpo0yr/Lyj7TvfbCkDU8dAnxaYIsyjBB00oNCME
         6zd+NPp8355nj0HL2YLT3GXVNoL05W6kaeucqIC/xuL5oNYVEcL9eXUVoAs1bNe8EEqv
         7TCJmrglxqZvQxM5Ma4oCjCXDw0+r02LptcscrPGJH7BOLQem7Tq2V3Iv0L206GKX6IH
         9bA2LPUcsSY/o7zoxJPAT7M7OIM3klc168IYDKoIrVLxHug5pzjE9tKBUnDnj6GFGU60
         bJ1GkVwsGUMAwWyiWGaMU72n+XijP5aRby3PdrSqNZ4kS4w4t7/aWNk4Xci2aclSiLy3
         SCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112582; x=1730717382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=;
        b=qdecB4Pev+dQyxPCcvrS9Q1VPVQQy+qSpKk93zOV75APlxQ86oS+cJoa6rder+leFV
         aVRb44LIIpikN7oJYIhxo9hlg7Pgn7M795tZqXgZDaxkCY3kjCw/9XvCcpLSw85COi2H
         eusb9bHQ7HiP1EyuHl5B0vUd7APj/Z/TpVXz9pGez7yp1Nay/3zjCD2LS+TMBjV/gYLo
         uv4cfYGBaSW6st+TnlSqdVOIF5mEdTAv33yDu9Gudx7ddsFp4WmkjJFK9B+HFKoocWsc
         TSiHorePVX7l5+1HbJSdnkW9FI8I2Ca+jNFyan4jCh9YJgtSoEs48eGbMnc2PVfSWIEE
         27Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUvEzscbC9tjHUWTPSMvA/dQGz3hb3Lx+TYaFchyTxmC/HElJFJT3QNe+Hty97PzSBd6inp9piyRH6TMSY=@lists.infradead.org, AJvYcCX13b5qXtbg8TQYcZNjQvnQU8wrsa3IZ1CWiKygd9IpFV9REzdbK5EJViKSGwKztazOSFYDZVHFRrrxxJT/F+4eRA==@lists.infradead.org, AJvYcCX7ez5ueG4k+2DSG3z8XadXpIQuGXfxNSKYNfeKHcgbOYPKrf74xd2oies7Jzm0sMpJMFt2Ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YysjJi8kb/6vTiD6U/meP77t15g/X8RWNgLxIUdt6/L95hrdW+U
	mBt5yHU5EO3E3EiCljy/YhyhG8QvNaQ0GUwvCQb7+rVJMvUQgB7Q
X-Google-Smtp-Source: AGHT+IEm+HFLbPsaDOWlAHThJ3+XtoGjdhXujglmfhVMP7yNqtZqIoTJpMUXVSYjXbaSqnnT3/SHtw==
X-Received: by 2002:a05:6402:5202:b0:5c9:5cff:3cc2 with SMTP id 4fb4d7f45d1cf-5cbbfa71a66mr5776613a12.29.1730112582021;
        Mon, 28 Oct 2024 03:49:42 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:eb:d0d0:c7fd:c82c? ([2620:10d:c092:500::5:1494])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6258683sm3063919a12.20.2024.10.28.03.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:49:41 -0700 (PDT)
Message-ID: <71decb01-4241-4fb0-bc38-187e180d6ee5@gmail.com>
Date: Mon, 28 Oct 2024 10:49:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and
 early_init_dt_verify
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, will@kernel.org, leitao@debian.org,
 catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net,
 saravanak@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
References: <20241023171426.452688-1-usamaarif642@gmail.com>
 <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_034944_747397_3DD0A289 
X-CRM114-Status: GOOD (  16.14  )
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



On 25/10/2024 23:15, Rob Herring wrote:
> On Wed, Oct 23, 2024 at 12:14 PM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>>  __pa() is only intended to be used for linear map addresses and using
>> it for initial_boot_params which is in fixmap for arm64 will give an
>> incorrect value. Hence save the physical address when it is known at
>> boot time when calling early_init_dt_scan for arm64 and use it at kexec
>> time instead of converting the virtual address using __pa().
>>
>> Reported-by: Breno Leitao <leitao@debian.org>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
> 
> This looks fine, but what is the symptom without this compared to
> before the above change? The original code in the referenced commit
> above didn't remove the reservation at all. Unless the current code
> does something worse, this is new functionality more than a fix (for
> stable).
> 
> Rob

After the series in [1] was merged, we always get a warning when kexecing
a debug kernel, which was reported by Breno in [2].
The issue is using __pa for a fixmap address in arm64 as described in [2],
which could result in removing a memory reservation for a completely
unrelated area.
That was introduced by the patch just before 
"arm64: Use common of_kexec_alloc_and_setup_fdt" [3], but arm64 switched to
using the common kexec fdt function in that commit. This commit is trying
to fix removing and corrupting any random memory reservation (and get rid
of the warning) that was introduced by [1], not adding a new functionality.

[1] https://lore.kernel.org/all/20210221174930.27324-7-nramas@linux.microsoft.com/ 
[2] https://lore.kernel.org/all/ZnFKEtqfqJkYflwL@gmail.com/
[3] https://lore.kernel.org/all/20210221174930.27324-6-nramas@linux.microsoft.com/

Thanks,
Usama

