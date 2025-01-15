Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30210C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Kw67OIBBLmEStPVTyogH0wxEiR1fl+xyxzlDKAemyc=; b=lxj5E56gYZbjzP5+fT9Fb6gOMr
	agZGxOh2I5qLG+m7BOHFPO9H6iX8usgD9q+7hqKzlhOgLJHTv6SXFl2XMVPxH9GES7GXd92cAf1lm
	TH5K5PKFthzckzRcPGN7FzuJF6jGh2elaOusyVmmiSygwvogjc11ulQAZ79l4W0fGdqaj6VenHiW7
	QSovrlIrakeEeliLBgRw6dkS0y2N9kKKe+ceVLPwMQwlAsTVB5ps24/aEp6wDFc0cf8ofhnqGZzOd
	tRepAltaXKOedPGe9QDDhbo/58Hhu+0MbnNLAcsGmclT8A114gXnUdiKdOFwBF6rp31T7xPfHE/jl
	jTfkV41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1SG-0000000BehS-07RG;
	Wed, 15 Jan 2025 11:21:00 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Nc-0000000Bdlz-2DiY;
	Wed, 15 Jan 2025 11:16:13 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21634338cfdso113626585ad.2;
        Wed, 15 Jan 2025 03:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939772; x=1737544572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Kw67OIBBLmEStPVTyogH0wxEiR1fl+xyxzlDKAemyc=;
        b=VSVvUrt/zxaklMoj+B/J4mCXXgOFwi1c6YnYwmfwUFPKzMGK+1TX4BwfV7ZfBHoP+Q
         dlwt0VSR56tWdFNiB+hVBq4Zmm/6tExAbP6qtu8+9ci70PclnVZccjDeBbpafD47FmOB
         FjinbrcXEp5L+a7HYAM0Lmnmw/Fs4p/0K7t4wIUi5O4BFNCDrq3QUrmedZn5LAx3FLZk
         s8Xd1DU+3QwrhnHUmEJq2/w5JL1cioJTFsvDHb/HDGiHWw5+xs2cTrmMQ5xixAbBCMau
         xzULaG6EmI+bi8CgX7ft37NnWMLJ3Iirfm76x4AKm3nCfCIm6n383R4lP+SEVlGYF3q+
         v/zw==
X-Forwarded-Encrypted: i=1; AJvYcCVClY+mXDSNWefNlCqWApwbe9BUnphRjB7mFw1a4krxiQCCUhZ5mLr/HuHeEPq6droZeD2tLvwo/E5MaGIQnII=@lists.infradead.org, AJvYcCW0uOEqPlDOR4jxqMngmOPmNo6XiF6Y4VMCPXg2EZB1729L8mnL9sYhVELS65QMyAnc1ElzYratN6RfJ4wipCPt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4fEXbfSo54dwsk84UKYxNdxbWDwhs/rRcChTl4ZdPLKwEvPdv
	w+3iYrubXPHdVBsPJl7S67alTmCQDAXrRpn2r8RhvPFUMo9oc/zM
X-Gm-Gg: ASbGnctnOtWHlrqeI6C79e7PWz9XuprGVB47eRVqJUejRduOglbz+QGJ+WS2K8Z4Ag8
	l/PrDpQmycfukdY4f6qSRYdHiEkE+D8pOHmq3tjt5ItIhTb12BMOymDMcdw/nKjtYgttmFv0+hb
	+7KOT4aDb8sgVUwha64/tzCM4YcTpIMmi0ShX9z2YKRK/TGHA1RZzZsh1zk7M6KnWwGUl7TL3qO
	fQvuenf5RjWhLpdca3gIXAhAhKY8pNrL76fgnlKyHlFAmwy4KVMs1UX9juiWmtm1VKJVAk3u+xs
	bWTm+hv/V3reHTM=
X-Google-Smtp-Source: AGHT+IH5OAsVS2PlRnMNk7lD8elaMdkqgDDfyGz9mjd0ExeYOdTBcE2chmXF3h2Tj1xi3fzo5sfr5w==
X-Received: by 2002:a17:903:191:b0:215:a964:e680 with SMTP id d9443c01a7336-21a83f65330mr424297155ad.25.1736939771781;
        Wed, 15 Jan 2025 03:16:11 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21bb316b825sm51658385ad.237.2025.01.15.03.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:16:11 -0800 (PST)
Date: Wed, 15 Jan 2025 20:16:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: mediatek-gen3: Enable async probe by default
Message-ID: <20250115111609.GC4176564@rocinante>
References: <20241220145205.1.Ibf2563896c3b1fc133bb46d3fc96ad0041763922@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220145205.1.Ibf2563896c3b1fc133bb46d3fc96ad0041763922@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_031612_568644_963C6D8B 
X-CRM114-Status: UNSURE (   8.20  )
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

Hello,

> Like other PCIe drivers, the mediatek-gen3 driver has a fairly slow
> probe. Turn on async probe since there's no reason to block the rest
> of the system.

Applied to controller/mediatek for v6.14, thank you!

	Krzysztof

