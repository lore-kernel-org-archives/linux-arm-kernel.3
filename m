Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27240606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LeewTBqJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M7Zm5MxW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0lp8ix384KyuQihbhJDejl7Hsm+NKly5D1mQFcd+Ymw=; b=LeewTBqJOMvNZd
	q4oZzT8dd3gz3QZ3Kwc/GXWTLlXk6nsm/XVrMH3pHcQKSvhXc1UqZnL0iQRl/dtDsuYDb5TJA7Ojo
	QSIvGHxGoDrEAvPLrHLfRmqBPeMEOIRS8Jw9sGu4sWo4l1fo0CI6hZ9g2h0kOlqKxrzNyZXMHSBZQ
	E7M/jGuJngrRFRBA80QOvsRE3CLd3/a98qCRyJFD56g9h/nzuxpQgsbJ6NyajE1OOL7ddrpGz7JZ+
	KRC/LO4XnJ7FAEnXsM9z6zH7NPYwnrYk00RSrJaf/Mj+nPErDb7EjOC7xn5Hbo4sfXkSiR7o7PKCo
	fpqEyAMQ0ouhDH16PPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdXA-00000004ADv-28t4;
	Tue, 27 Oct 2026 09:31:56 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdX8-00000004ADI-2ez3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:31:55 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2e934c6c1c8so15468555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093514; x=1793698314; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0lp8ix384KyuQihbhJDejl7Hsm+NKly5D1mQFcd+Ymw=;
        b=M7Zm5MxWeesTEcO6B+8NIf+pT/vKqO+89AICqPuZpPkdFcbkZXGxesGL+TaKLSNyIf
         VtiI+2iWXIu/q9TyQNF08PSvToV/u2APC/GYoEtN1sqS/aFt+z/LTRQjEIss2+PGLPe2
         sFjWBqN0vRLy8Ah3b2veveH5SR0/IB4jpiQ0DIDveqfVXuZln24vUcHdlN3VUaFtKui9
         jNLONqNLeZ4taNAYPc0t2HcXQaQ0OrXeNDurEfP+RjxO1eYXafVtWEVDS6EmPB1GvXpp
         4icRhjeAzL3fLkXDxMC+Bxqa1Abdl32UxGeQBfXn0gBiHsbC68SdgcX7vrv88emPjzJC
         PKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093514; x=1793698314;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lp8ix384KyuQihbhJDejl7Hsm+NKly5D1mQFcd+Ymw=;
        b=N5FUO1M8aCkBNKuSLZQJAalPUNbKFQw+vOt772+NkY9b7j6HvtIuyBJcKn6COj5b8B
         NGWLhInnVUyaAkGeliS/OsQqGHJEmMKaccMA1Fkqqk+gxtRnZhXdcMxDXcj9MX9JWr9v
         8oSIHD0ZEwm5zi5W0nB2PdNt0MqWMaeH7RM9O2o/+GQAeZDoQMc63oPrPKF/Q8wBBNEy
         PPom68Bpbd0qngd8hd0HOH9USQBrHUEUb8aHAifaBWtj9Xg29j2YUbQMquuthTEpnXdG
         qb+IptayMKZv3S6owq/VC7bkFRHHZ1rHeFX7IILW2oyOAUy0djJwhWyexQJk6nV5OQF0
         Excg==
X-Forwarded-Encrypted: i=1; AKwUvBw1QXmIHG5iZUVHuGHu1mDQMnLPOEVYym8kcSx0pfsUwGUtII0ue5B444/HCXM0DR0H6ESLwCsY2CadytM37CO6@lists.infradead.org
X-Gm-Message-State: AFq9FYJRY82KwxmEbIZyQOCZPAn4u0O9TshYovzIbp06hzuaRUwYLB2m
	EnqwatLsQ3+x0CvjLlNT1xkFZDoBVOcUL7MMDbEj04Lkb16gIA6Lydjh
X-Gm-Gg: AYBFou3l6QvzjOZ8HP9sZnleNqna8We3Psyr1BjNLh0ofhr7taSfwrje85ntD8ZNSXR
	eGQB2Uishf8yVYAGnx8HRmi0V3ZAMoh6INGLxoxci8qhyHWbLDMFgKDZQROGh7NcvwV363gU3JR
	6EEKBwhq9Uu/UoYIZGwqaXM+SIoB/2gr9UfZBdOOiFpM8SLnfREpE4D8+n+YYAtnvn2QZ+gnAGv
	vLEdHcHEgFkEriKmwtln2oRiao7wBPQ1D94qS7Je8yth3LYihWZCIM7ACwAyfz4an0/txx6kHw+
	YFmmcjc7UfBxMPtJaC/3Z65sq/Usq7qezmBrPvIvroBlVlaW/9FBjSqCIXYmlNwNx/1igTMECXa
	+uqu4o6Ikz/cL8t0EITA0lnL6lig8t+mUM1tjQg+cDHFkLaWQOhQy+TigmRMjOI8R5bUY7I179V
	KRU7daN1NYNDXNzpleWnhqf9kRPCUZVoROQMJhKo9LO5xkX0hhvOmrEI3SoPQ62524kTLBW+6DG
	U+La77qSPAwaBfIE3mWCxBKABg/h2WcB/a74L8fjDf2gMZQQ6SSpqzobUV/MOpvkRXDNJ81wBc8
X-Received: by 2002:a17:903:3c6c:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2ea9c03f2ffmr86182255ad.8.1793093513672;
        Tue, 27 Oct 2026 02:31:53 -0700 (PDT)
Received: from [0.0.0.0] ([129.126.71.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm6281855ad.58.2026.10.27.02.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:31:52 -0700 (PDT)
Message-ID: <e9764219-8afc-4e8b-985f-9611b0c9a28f@gmail.com>
Date: Tue, 27 Oct 2026 17:31:44 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, rafael@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu686@gmail.com>
In-Reply-To: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_023154_681936_0B9F3B1F 
X-CRM114-Status: GOOD (  19.06  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome,

On 10/26/2026 4:57 PM, Jerome Brunet wrote:
> On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
>> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
>>> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
>>>
>>> Every S4 speed bin runs the same CPU frequencies but needs its own
>>> voltage curve, and the bin can only be read through the secure monitor.
>>>
>>> Read the bin from the firmware, select the matching
>>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
>>> on the SoC compatible and needs no node of its own, and S4 is added to
>>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
>>> the bin has been applied.
>>>
>>> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
>>> ---
>>>   MAINTAINERS                          |   1 +
>>>   drivers/cpufreq/Kconfig.arm          |  14 ++
>>>   drivers/cpufreq/Makefile             |   1 +
>>>   drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>>>   drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>>   5 files changed, 202 insertions(+)
>>>   create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>>
>> Is it safe to apply just this one ? I can take this via the PM tree then.
> 
> I would advise to wait a little for Amlogic to chime in.>
> Patch 2 is something I already rejected back when S4 support was
> initially introduced. I suppose AI just unearthed it and did not bother
> to mention it.
> 
> Amlogic was supposed to migrate to SCMI at that point, and possibly
> handle CPU frequency scaling through the secure fw entirely.

Yes, starting from the C3 clock upstream submission, we replaced the 
SMCs implementation of the secure-clock with SCMI. For the latest 
released Amlogic SoCs (S7 and later), secure-clock is implemented 
uniformly through SCMI.

> 
> They did on later SoCs, I don't know where their FW stands on the S4.

Most S4 customers receive a secure firmware (bl31.bin) that sets 
secure-clock via SMCs (because the S4 SDK had already been released by 
the time we added SCMI support). We have also provided an SCMI-capable 
bl31.bin to some customers.

> 
>>
>> -- 
>> viresh
> 

-- 
Best regards,
Chuan


