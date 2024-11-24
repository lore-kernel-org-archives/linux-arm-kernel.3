Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1ADE668A0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmXw5x+IHnQ+uyZyOzsZS9Ul8CDlJvIGgeW1yGyy9es=; b=YQomCSUcZ1fM8q365iYSQGenP8
	CzIscSCfCZcidcQ4iERH8NbqzM5Tnv+hEJ+8kx1d/BPlxNllUmF/FJOQal9kTNk8v+E5I6hXlwyt4
	jZX+Y4YEup5vobxNDmThS+LtnxrFhRazAMr4O88hTufMKgcwnhU6JwpShyIF0daGw6ei8Wl02uHEG
	FMtsywsAYYL9ckCiTsNG0JhV6KmYlG+5rxxUeZ17r6txqVdK3Us7ju+3s7IuEklRABrCkj14coJaQ
	urr2jFssxPVYZgu23Yb3BC2PZhHZBHUppc/LwcTXM/6RxFWzG4mnBEYxI12vpuwtGq/QVGy7zcLrz
	V1+l6T/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF8Jz-00000005VFS-2POM;
	Sun, 24 Nov 2024 08:50:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF8J1-00000005V6B-3NaP;
	Sun, 24 Nov 2024 08:49:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ed91d2a245so1197065a91.3;
        Sun, 24 Nov 2024 00:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732438162; x=1733042962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LmXw5x+IHnQ+uyZyOzsZS9Ul8CDlJvIGgeW1yGyy9es=;
        b=NSfC4l43wZM7SoPAXs+SYK4L1I5xzw++KyxNgwstHyfSf9i4x5rc55wbKBAL4xiEWx
         5B7OCXbVoD//cEGmLsp8+VdkTmkRNhLFpGxJHVEdcyjYEgDoqcDJVUrKOcpEt7NZKRci
         fk/28H21Ih+8rSE5ohcEmt4fzRKgp3JXmaUmRhlY5pARHmi8Jnp+UB6jav2aby5IUCV+
         RUf06gCeFc2VMp83WGdm2pWweUr/sUndQIBjU6hFiKuVFiekVz/VeiA4CyAsZ2XsOS21
         kLSTbLRt4u0ojYl1SZrB+PdvIsDy91UJZCa5dbq6i4lQ+k4+ysML8Efax1qJNAue4nFj
         WxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732438162; x=1733042962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmXw5x+IHnQ+uyZyOzsZS9Ul8CDlJvIGgeW1yGyy9es=;
        b=A4hbCr/F7UcJN69/RXkWkBbivq+FURdleBycvY3oNYIQwumLkMillTDCH0x253aVmI
         bSgkNNwgyi3gt+T8IPCUVgR4DGmNZwdkyxEJbitdR5iAgSTDIzZMvLgRtrc+yhmX01J6
         nxSXTqb5eJvR5kHEpdST+Ik3FyYunU1Tar5SdJxF07z6gpc0DQeaf3E0L6leh2rN7d+S
         eAjHdLm8/ljS66cb7UVLC0IRToIsps/7uDu5Y1V8GeB3v0m4dSW8CsimEyvwi3SM9wXT
         5DfAwBXJRQ8L8gvOiLMgR1a4VumWJm0SW60a8t+k8o3Awj3Yi76utrGmIdtDlwOIUMY8
         PTfA==
X-Forwarded-Encrypted: i=1; AJvYcCWfGl1ydh2AG8vToBe5difnZ/zmfDRuMFE459/E5UKctJRt8hxKm1zwT8K0+swtr+Vtck6zgDFfbxKexxJmhuQ0@lists.infradead.org, AJvYcCWtSX3rJejObN+yk3S5eHlB4TQMkWvMYOg8u3XXYB+UxyYBlcjW7/6TzczPJsd4kXn9R2vLETqZC/N7usjm1nmpdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJYGbZ7KJmT64iv/VwMfPdX1zkrz1sXoKLU8FhoaUerZL+I/q5
	ur+5cPJneCwGTsPcB/UzPSct72AWZEZkTAxBMOqCLqTpHvstG8Hv
X-Gm-Gg: ASbGncu4SuIxa5Zc5xsv1AZH7qQZbei5Dv38FBd0Aj/kDVXmAxe8x2rY+P54IiNpfpX
	vJWEUyeP8/g+eMHtsq+zbatBFbIte84ywxBE1qPrz9cjyA4Yb4sPTf/9x7kKZ88pEBE+ddgqm4b
	WyZCIejtZdQHs5gc5By6WRSeQ1j5mvCXtqmjNt0N0N+SZ7XEOqY6o+8/76dM8JLEdcSRWCXGqbt
	MpSN5NyEAfNrN5qJKjWDbJni8PWOBeE6KJNCbQGvQnMPYPi
X-Google-Smtp-Source: AGHT+IEH3mMi3o2bStvSwRxcifpjaLZ8OllmWfCdTQV1ejr3K9yGIW+YcJaNskNnLTGCjTfUb7Zamw==
X-Received: by 2002:a17:90b:1bc2:b0:2ea:819e:9126 with SMTP id 98e67ed59e1d1-2eb0e867634mr10258380a91.26.1732438162379;
        Sun, 24 Nov 2024 00:49:22 -0800 (PST)
Received: from Emma ([2401:4900:1c21:cadf:5054:ff:fe53:2787])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0d048e94sm4460641a91.40.2024.11.24.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 00:49:21 -0800 (PST)
Date: Sun, 24 Nov 2024 08:49:14 +0000
From: Karan Sanghavi <karansanghvi98@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexander Aring <alex.aring@gmail.com>, 
	Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4] dt-bindings: power: Convert raspberrypi,bcm2835-power
 to Dt schema
Message-ID: <qb5sdh55yj7est52netydaauazgluej6hvvtutmmiw2bhglnpw@lq2cyg3hjhlw>
References: <20241028-raspberrypi-bcm2835-power-v4-1-acf44abd45ff@gmail.com>
 <bdze3425qwrtlvlairw2b4xiycpkmhirzhqn2jt6jngc3bu4ta@uo4nc2lnj4sf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdze3425qwrtlvlairw2b4xiycpkmhirzhqn2jt6jngc3bu4ta@uo4nc2lnj4sf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_004923_964775_1B642322 
X-CRM114-Status: GOOD (  21.22  )
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

On Tue, Oct 29, 2024 at 08:10:23AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 04:44:12PM +0000, Karan Sanghavi wrote:
> > Convert the raspberrypi,bcm2835-power binding to Dt schema
> > 
> > Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
> > ---
> > Changes in v4:
> > - Corrected misindentations and random differences.
> > - Link to v3: https://lore.kernel.org/r/20241026-raspberrypi-bcm2835-power-v3-1-6621e075d33f@gmail.com
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> <form letter>
> This is an automated instruction, just in case, because many review tags
> are being ignored. If you know the process, you can skip it (please do
> not feel offended by me posting it here - no bad intentions intended).
> If you do not know the process, here is a short explanation:
> 
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
> 
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> </form letter>
> 
> Best regards,
> Krzysztof
>

Dear Krzysztof,

I hope this email finds you well. 
I'm following up on the patch I recently submitted linked below.
https://lore.kernel.org/all/ZxEm-H-PjlQyXeOH@Emma/
I noticed it hasn't been applied yet, and I wanted to see if there was 
anything else needed from my end. 
Please let me know if any further information or modifications are required.  
I appreciate your time and feedback.  

Thank you! 

Sincerely,
Karan.

