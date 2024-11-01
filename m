Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6057DD5CC99
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XPa1IlpixAalo9BA/o5sNKVNrHLCsckth76VFUIYgU=; b=nqrEzwVcX98n5I+szbdvVC788F
	UT3ASVYvbrPibPGa6s+l1hLx1t9OHA/dQsc80avOL7feBRvN1QY6CVmWoKCkvTxqoB35rw/h2awrZ
	3RxuOyzd8/Cv8FalTgbdGTZkdFD0M5SzrFLOO5oLXR3illjvZQV/XxHW9wdY+mWhjmM0f+aVH7TUR
	UZtSB8GdEPX/X2Mef31kXXsR/SiUT4c/nDmLPXHMM6+GohbhHiUr3pLzBrjIe2qVXLd/AgRLIJvfo
	9hfNZSCmkWdDKtTOkpcOmwKsmcS00CFljo0gTgJF1kTEZffbsPcFypElrTUi/+ZDysD3TjEj3XRyk
	nk3DHG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oFa-00000006Rsf-3KYT;
	Fri, 01 Nov 2024 09:47:26 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oDC-00000006RSE-2hKC;
	Fri, 01 Nov 2024 09:45:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-720d5ada03cso114812b3a.1;
        Fri, 01 Nov 2024 02:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730454298; x=1731059098; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5XPa1IlpixAalo9BA/o5sNKVNrHLCsckth76VFUIYgU=;
        b=HXlV47BJZbypZhBtZxGenXW/bt1BnFM2h/Hbpu/UFqAFbkxbmrEkETpnHb7BzP4s/z
         vTQHy9Z3JhZTLXwY2LqvQV0endObGBQVcQvsC1h7AkQhxjKaRT/2Y/UIB5IpZaDH0a7l
         og0k0VaWlj8nULJDJEHz0FSbjxe+ppbOMkBTje6YvfLpD0WjMz3MlWfgmdbt95vRR+rU
         WRTVhKChzzTiilc5nhoQLIlaPsrFKjz6+dZUA92eZJAneed/VHXciUIHokTB223wPFaZ
         lYGv6m/1U9mVWI2YAB0ETL9WLLpfbB10EDjxrxcnqGN23hf0WlmP1nU7sXvFcwc3blIM
         uIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730454298; x=1731059098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XPa1IlpixAalo9BA/o5sNKVNrHLCsckth76VFUIYgU=;
        b=vo7PDNp8O9Jhjgtk4hPal4diHAbZgAoBBYYR8gkQ4oCYvkrXtDGLx0X55I7IF3MKCL
         VHrPIZip+K8VkJyDh2gNsZaSI525uTynBNyOwgia+Fq1iyCoCJlGd4rTCiuyhLU13RRg
         8Me9PhFn78kkcyqJMWplEWtH/fj+Ib+Gb2WJ09XwlvFhNtYYeFxdrC9yo1MgZEwOu7Us
         UL7mBGsDDE8hl9to2k7bw+a9htr7R2IhoT3/2LStUapoHCCIjMMlFSiB4lFwoSObAOuY
         onBDfH6vGaJ1s2r38NSJriU2MjpnNjKpq2BF0gy48QxukxVw5nkedsZEZStq/z6QEUE7
         eDMA==
X-Forwarded-Encrypted: i=1; AJvYcCUj9dskW8WtjKA2LhE3KBAoHSMci1WzjNYusLV0eLVGf4sADpHJkT6dOkwdgrQPD8obndJyH7ywBWQbyFo=@lists.infradead.org, AJvYcCUzZvoGxarOebO8awNu+H9ONryEu5w84eHoKWq/wo/PLYMUd+cZ//SvfO6vH799JebmynezyZsCK4E5VYdcBe7u@lists.infradead.org
X-Gm-Message-State: AOJu0YwIqteEsjoOlGyUI88ZG5AJf7TyD9A/tiRS3/fAOSfTMMxIFC9f
	PWKnj84ZoDxDUZChjwowLa1A0h9r82wm7Gr2BTCOEqw52wTvUnYr
X-Google-Smtp-Source: AGHT+IGzz+VDzAUOmgRPvDn9gKwbiqOY+8Ufm53TjoKqgLSjfioPk2EG5eDX4bVncoKvbVOiHTGVQg==
X-Received: by 2002:a05:6a21:e8e:b0:1d9:2453:433e with SMTP id adf61e73a8af0-1db91d517c4mr6918796637.4.1730454297630;
        Fri, 01 Nov 2024 02:44:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92f90c6ddsm4712932a91.0.2024.11.01.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:44:57 -0700 (PDT)
Date: Fri, 1 Nov 2024 17:44:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC net-next 1/3] dt-bindings: net: Add support for
 Sophgo SG2044 dwmac
Message-ID: <hlnvrmxos77rw4fftwnyg6q2sfjgvx4vlzdvyuf7kwiuamcvpa@llfuqlijev6t>
References: <20241101014327.513732-1-inochiama@gmail.com>
 <20241101014327.513732-2-inochiama@gmail.com>
 <uzr6gpmyng3irrhuf3q3bvswlbzyxnr74jwccyosplr32ceczu@jjrva67iq4ce>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uzr6gpmyng3irrhuf3q3bvswlbzyxnr74jwccyosplr32ceczu@jjrva67iq4ce>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_024458_704606_C6DF028B 
X-CRM114-Status: GOOD (  17.81  )
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

On Fri, Nov 01, 2024 at 08:51:11AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 09:43:25AM +0800, Inochi Amaoto wrote:
> > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
> > MAC (version 5.30a) with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
> >  2 files changed, 128 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > 
> 
> I wish patches for review were not marked as RFC. I remember this
> patch, so I don't consider this as RFC... but that's rather exception.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

Sorry for the change to RFC. I was told to switch to RFC as it
has a unmerged dependency since v2. Thanks for your review tag
and apology for the confusion.

Regards,
Inochi

