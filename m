Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CECC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 23:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7HEWR7W+LW12/jXV4a/HmVZdHf49bbez23dSm4ZpUA=; b=oXCNRHSeVEG1ZJwLW2Sdu6dMtM
	0qi7D+UDe6SKYaVS/CauKJv1FodLfvBIu3nDT/8rArx4D9J8iMi27qlAh8OjGi1JCmNIvcdrH27m4
	J663PnHhBQWO610LqPuH8cXCdJJDCnkWFNP0zoEmwFWHVEHU2aKKHQw3Im30+K6MdhC2iLr9cSMFR
	6ulPprVyRqFeeGxwIwQs4+X6E/FStaQncrVeld0LGi8A8Zw1eSN4OPdwScUIefmnvcJjiy4HKwVT8
	aDGdmp3bJlCjduIel5wi5E8yuxM/hb+MY7IN+69KiLuw241inFLkm3sLnVPoLGsrejr754HBAX6q6
	SkwJUx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNeA-00000003fVy-0CeU;
	Mon, 30 Jun 2025 23:10:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNaM-00000003fFm-4768;
	Mon, 30 Jun 2025 23:06:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-235d6de331fso32631605ad.3;
        Mon, 30 Jun 2025 16:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324810; x=1751929610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7HEWR7W+LW12/jXV4a/HmVZdHf49bbez23dSm4ZpUA=;
        b=PxsNWs08KR+rUPcl74ZIHMVD3DmAq2CnelPbtRuTFyRQZ8ukbJNALRheb8MgsOAVqw
         ZN2fFRTMQ3Pux9q6yMahB33NC/kojM/3zkwH9F3+d3/bV7LR2ufN6+kdeLpIxBKI8cpB
         9SdXsnAci5AV/UUyVR63qAoFmlMQEzSwmRS/0RQ5N77wK+chlJFPgFfODVTuOpMXij2r
         RC/h4BMjgMdulmKywk1DDLoQhBlDCRhuaO/MY5Fryyr8xlDSKJ7f4mc48L0MR+LRa1vt
         o4pZK6yIGOWIhfqVe0wXDlukO+M3gMNFKF1mH+/EKjZlVW1sEa4wrtGnncmeMvYHRqAg
         BgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324810; x=1751929610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7HEWR7W+LW12/jXV4a/HmVZdHf49bbez23dSm4ZpUA=;
        b=Oy36P9OsrOxdF7IAd9zEVzovWW06h8yBQ1p4xSYQqapX+1DQaLDY8Yz0KAE+p8MRbm
         VrGzMl/G+DagvBWBWuu9D5o1SeXC9fzmzolhTqEUM28mb2VW/K/vfqPZYHMbbT85qr3C
         WTkhkzLM3+CJgGvut2x+tt0eyVfD3iyyueRhc+uxYHGlq/cC4S4RcS+VN/tuHr3pZAmv
         pO/GFgkF85vTmgWhJtXLBZ+GDkiGhWEazNxleZsFk/KrMqRhjUcWIAIGvXstMrfmqX9P
         A+U5msFgN04iwK/8uhruZ0b3eg5xR1ENTv4vmi4ZueAfZ76b6orrzkQHAMcwbejbsVe7
         n0Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVjcM/jYmpCDOoVEpMHBLLG9FRTGMD16IIk5IpIGz7nBjs2oYjgh8KcOZtAiIPvJVj2Q+SNxgPKYpkHSwx4xhug@lists.infradead.org, AJvYcCXvc1Xr0xjY14nQAs4Uo1czdE+Ic7+3zRZF3p2GGeUqzIG/Zh1yQ+xqmj4dKpJGJAbsDUbQolfiSUBbqCOsJmc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhewacjgf7uqo6p3gL3sPy3OMa2y+b8HC+ZqMW/RR7CsytbRnu
	EHgcBPJJAc6OVoGa8qcSVMhcqzFMYE4mF+yEtbcJAsLaTi0dIx2HXiJd
X-Gm-Gg: ASbGnctukOKQQU8thbxmeWvc/bwfgHKHSbUN+dQiuAMphAeScI4MKMH6B289HTBNGq1
	VfOyet4B6fOkcDTaflDHBnlYcpc8o1yDfAZ/GYoloXH+2DoQbZzYGL2tNFjE0ipUCmVUQ0PsgXh
	Q68Co+xZsa/tnG9APuXcSQm3Elq3ECr7maT4eznkC5cKtprf8vCl4oZeZeWbudLw20lc+qY+qFS
	DabgUtkoQFGz/ZR22exZqwxdxd82HI0De7QfQVuaijpU9Iv8+pS2naBeTCKvAmoIdJVXQs5vaJe
	DsxL07HNbK7a3Ox2abKA9IiNXibVJVzGZAvi8YUY7cTBJ2ldt16qJWBYpjEHEUKY+4HDFev9
X-Google-Smtp-Source: AGHT+IEE47BXgA2j3N8UCj5gWmCgfmS1t0dx9jkTxBOSMo7yULL5sWujT/QCBMOL5bzUJpKm69dV2g==
X-Received: by 2002:a17:902:e94c:b0:234:f6ba:e689 with SMTP id d9443c01a7336-23ac46341eemr199554055ad.39.1751324810159;
        Mon, 30 Jun 2025 16:06:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39be0fsm89850265ad.95.2025.06.30.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:06:49 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:06:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
Message-ID: <zl5eusepyz62tnfidafvzrgslzftipiysy2ugejomqmzgbc22u@etf4uo2nvqag>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <41f3cc74-694e-41be-b767-20c7561990b8@linux.microsoft.com>
 <667whxdsghpao5irl66oh66l5y55m4k6n3ztifaizbqtrzccju@cmghlz2yauxq>
 <44e48ee7-07a8-4bbc-a98b-095bb1d585a0@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44e48ee7-07a8-4bbc-a98b-095bb1d585a0@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_160651_023652_C1C9A16C 
X-CRM114-Status: GOOD (  17.73  )
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

On Mon, Jun 30, 2025 at 03:23:36PM -0700, Easwar Hariharan wrote:
> On 6/30/2025 2:46 PM, Dmitry Torokhov wrote:
> > On Mon, Jun 30, 2025 at 01:18:40PM -0700, Easwar Hariharan wrote:
> >>
> >> Also, it may make sense to CC: stable@vger.kernel.org for backports
> > 
> > What for? Stable does not need a patch papering over an oops, it needs a
> > patch making the keypad working on the affected device.
> > 
> > Thanks.
> > 
> 
> I don't have a stake either way, it was simply a suggestion, since it qualifies
> IMHO, per https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html,
> the patch "...fixes a problem like an oops..."
> 
> The proper fix might well be, as Nicolas suggested, adding the required compatibles.

It looks like it is not only about adding compatibles but actually
adding proper support for the missed variants...

Thanks.

-- 
Dmitry

