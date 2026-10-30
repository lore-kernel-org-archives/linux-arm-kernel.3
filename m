Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5BF60A2601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Jeivh7+;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=fSP7v1xF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=; b=3Jeivh7+4dmPxh
	Fdwipqe2hOzuL4dmP8ZXwIfzEMAMbIzbNQagUMcswuOikF3dp593ylHR2m9CyXCrxc/aM5H90xCmo
	cay01M1PR2KHIFCO0P+VFkiO/dDAsnwSJ7fdyXCfg3wvn2l8aJNP16nEdfMAMGd0qZioNLhdCtA2s
	eowEl64TrSegrLI4EFMYmQ/I2OqSCBZbxDS8mnJX7PaBk0PImy0lYfAoegwea0sNtaNnjaqqw2rUG
	4I1IMypM3WnL77Bm2yraHNvOu5ZZ9qOLbEPwxOMu+hem0Z9UbrJAd3p+g70tjq7PrxSrz93zj7w2V
	RLJWL9GbibEijk3OsODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmvw-0000000BmKQ-1pPm;
	Fri, 30 Oct 2026 13:46:16 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmvs-0000000BmJc-3eI7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 13:46:15 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-53a448f86e0so462745b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793367971; x=1793972771; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=fSP7v1xF4JXb1xfkOohy1HHUAo0s1QgZB4MKjrWK1ACH2Njrd/f8rrzEZnshy7x007
         qBXSvgMCeSUDtpA3PMKoyW5KoA9cGHFubS1DfWgkEzwAgqDUtadEDoI6rSORh+FSVVHj
         JAz+A8zPbDgUHlDnpA/Cz0dHEOph9ywSl6Xgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367971; x=1793972771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=qQQgQri7CmjI9cHeWLVnGuoPpcVMY2GvyEvhB5QCLFz+KCGZ0eIE6VsBya/bUwYphK
         rhIPCh5hK1uCRQ/ZRvOMCyQc9x8UjE115Q2bvPTScH7sNm9z2IfhoU5QuVk06fwPeCIW
         TOP0iyYZqzp3E3RgP9jRNqP3nNInP5u0DwPmr3YBgc50zKI0YBDjlmvMPVkmND0uQDGa
         7bPsMTzUzkHLvXnGjcqrR6X5b3Tizb30PllOWN9ve0oV2eOR5xZSLYSJZgBDLSRel+ei
         MYjEOj6G9GbGEUrNcLAHm72qHKNwy4uiSMIWkjFFPQrDn0OtRDeeZpd5Cvxezf/LydP8
         E74w==
X-Forwarded-Encrypted: i=1; AKwUvByXJCgh5xxFkISZCWbGbdhp+AHpbyYvWelwWWRCGXK6XlNfDcpPv8EqA2VHE3mD7q7I9LG8GozubC6lXxvjzFxp@lists.infradead.org
X-Gm-Message-State: AFq9FYIsWfW9HXI7uny9gfnvHkNUgagldU/ow7AKt5z0ltz7qddPTMAf
	yYqsKv9uTrRYlmR4JFEXzRzCuu6bPDF03DRbTj/aASYo+P5HCJFFMBWbNyBCrkLr/A==
X-Gm-Gg: AYBFou2YXBiuLCoV0xzU1veXNdMKqFTmfWhvhtcMS7ZilsXR1Fw8TmPyoHUsMhUKJDT
	vqRPu7dy6d2XpjcgRYT3d3leDgasy2GVHDrPjlsgv5G993xlqobkxy6m7sAphR7nDerKLxoDbIm
	FnWrliImZ0OikBwdZDVWCSze9S1BnkkGd1yLSpjjGgo0+NY8jZW0hOr5161e/uZJ612aASHadQw
	R/mOdFYvKM0iATJ5LBqH2E7qVeup7soIScieB9wMrh7qIZ4XBy54LwNRd7ihxae4j9B285QVB4o
	yHEvS1W2v1ZQe48YPAn/D7Kr3nb86VoFbzAEBHqxQAa3X1GKAH1E7cetvpVzqTizSQWKAVhiwDp
	3Ub7olQV5udW0kZANjj7bRfBfBXgaiJ4yNncTWTJxL14Hva3onvfLfvOf0quzWp7CgWybjmvzcm
	5vfWaK9AcCt64c/SytBVOkMPZxfeoB4XeoexSDqXnkeS3SVwNs8yuqK6us/vs87/1jZFJnLGIHP
	x45K4TkRmG8HUKlKe0uQCCQQz0O+8fLZKnouJdlmCdgYNUMyfKJdaVXnZ9iYcmt/KG1nwaURXJp
	6PYHwdy3qyLTwe7OiytRSc8V
X-Received: by 2002:a05:6808:151f:b0:4c3:6d56:77c2 with SMTP id 5614622812f47-5640de7e3a9mr1613306b6e.41.1793367971178;
        Fri, 30 Oct 2026 06:46:11 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-5640fdcef5asm1492922b6e.9.2026.10.30.06.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:46:10 -0700 (PDT)
Message-ID: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
Date: Fri, 30 Oct 2026 08:46:07 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_064612_998661_E919452E 
X-CRM114-Status: GOOD (  16.10  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 3:57 AM, Sakari Ailus wrote:
> Hi Frank,
> 
> Thanks for the patch.
> 
> On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> When CONFIG_PM is not enabled, all devices runtime PM state should be
>> treated as active.
>>
>> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
>> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
>> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
>> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> otherwise the same, except that it requires also the use count to be
> non-zero.
I think "yes."

I think the logic for !CONFIG_PM should basically pretend runtime
PM is enabled for all devices, and they're all ACTIVE and effectively
in use.

That implies:
- disable_depth == 0, so usage accounting would (if enabled) be done
- runtime_status == RPM_ACTIVE (power is on, no delay)
- usage_count > 0
- runtime_error == 0
- Maybe ignore_children is false?

This might not be complete (and could be wrong!).

Some of the other dev_pm_info flags could probably be assumed false,
because they represent states in transition between ACTIVE and other
states.

					-Alex

