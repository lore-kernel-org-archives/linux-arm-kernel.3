Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDB9D32D8A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZeX/t9XBIstd9pSBZ5++UMA+6ZEbyBEMYNpSCQ2HHE=; b=j6EXVIp0fITi8xgIh5n2cAwHXr
	AqwVBdYute9L4SA1YRiVmJxytj2giI6ccAEf4RvwG6h4GKTTL1WyYMpVL8GIV5WOcTnQYg0u7xowO
	vwkL0H9Do791GuHy98YUH6oVselqw7X+lXJDAVCpvn/BW37p152zR/Vg8XdUilwv3VbbfBzlhx9G9
	pFxMpAh/QBvtP1rz+fpjOZaJivUJTap53Zt2F+86obkzH07twE0t1lZjCS8ZqHFcRXNZ/TduTMHXy
	3iHlwfDLo+v3bTVc8WuCFfJRF5aubaXYvJU1mDo9DOu94K4I5z7V5Q2Og8N9vAems04Odz0Xmknl+
	gHLKoPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWwj-00000009bbG-4BJB;
	Fri, 05 Dec 2025 14:38:10 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWwg-00000009bau-2rUb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 14:38:07 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-642fcb38f35so1826056d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 06:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764945485; x=1765550285; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rZeX/t9XBIstd9pSBZ5++UMA+6ZEbyBEMYNpSCQ2HHE=;
        b=GCNoE7CvpF/5I9zF+1bHJZ0qU5+fJHDScy/kYBNyC0wW285wF+M8gn9hhl4HPcNeS0
         nfx726mLY0mIgZZWYAk6zejrPWdVNFHAHh53LyDNLboOWiMLiz87sqss9A+SnIz9DxFJ
         2N9lcG7FO2fO+8ph3R4ZZ7yt2zDq/OOev5X9HoiPVXzbr0N7/yn9LmYesff4SM5rqXpw
         sxBrPRh2iuv8UOID4IobK7w3xWgZJTHlFayg6OwAOYMcd4cN3cj1orpV7PN8tYth0UTh
         z/LSteFnSdoffrFxvvP+Ddvh2UQfUoUvNBE9u3QVditRTTCacZwpQMxrKhJ7BwQ0bo6Q
         3gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764945485; x=1765550285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZeX/t9XBIstd9pSBZ5++UMA+6ZEbyBEMYNpSCQ2HHE=;
        b=XU0+WkOu0coAY/RzxQuo2p/NlJl2JoYXZHMPSv3U/BgcBRGmvht0A4KE8wsAWcJsrx
         QlkiuXRyaAdQ7WfLO84Agj3EzI4FqTeW/Kq4xoP+v6OJ95M1MWh3D7mo4DUnGq+2Vc6t
         KQMiCtmkpzwlyKx3pgBrAE96fs9+wz3AYJLYIt4dQXJUIdKf6cCERsonokh+dTNksCkU
         48wydx/5dcQ2lAUnT6EKqp60/HB1sXx8vv6Ppv9wuBBQ6uCO+RO1cfTERP5gB6hYAFSI
         7lV4LjSrjShruAwrSegcGh97yd8y/GkvXLi0O0FlN/kH0hjkOV6+LNxmMDzr0XJV+cC3
         G8ow==
X-Forwarded-Encrypted: i=1; AJvYcCUDOvNcWiekeKkynjrSMbLA3uN6DXsk4T8it8PmQkrT0MStUk842LhWGF9QWTQ6stfFCMhum7FlU2W2+OsBFnww@lists.infradead.org
X-Gm-Message-State: AOJu0YxgpFIUyszLfURrZgUTL8wPe5ONlY/fC+0umCRKmWCMnbQiSonq
	x0OLrp0yxOGN2/XXTzf5+KMNfN8Ll0KG24khCJdNLIGo/17SEhd4xLFX
X-Gm-Gg: ASbGncshBfm26dIMrkaNh0iunLaq84JUMRP0DKNfUumvf7a327BFhssbVPlygXvvx0T
	l+YqZOFTXg6ZgyF+YT4LWiMtcftCATq1s3bckRJidXez2Q/oJEVX5ESdTCj17tfz3sMPRCub7CI
	NaS/iNx321Ljt8ceHomblS4niSI5zg3yiVfzOJAbBhpSuiTmQM5j/kZvYN0/ULBr0SQFBnLZN0s
	SJUdbq4g/7s1v+vE/dbz4JTkQEhwkAfd7dC73EnrUXJG7rU72122Cj6OtA1GH0MC+q8BPwMMsct
	voqZH0ujB7i4HBo6YlOll1LWGABaN2XQcKG3GPrTwjwZ3Mt/QzwBx/erRyiKaqvwPoGH3rWD6h9
	TWoayMmYENuUFlE7yvJeTS1hIA526a7BYnUJm69Q0IuAd9I1NJ9+zC3rL3UD+PWNCjHceJG51UZ
	hS09zZqlG2KqCHOidb/oqJml15ADzHkA==
X-Google-Smtp-Source: AGHT+IHZolp98udP+u1AjHHX7nPNhJRkfNJpkP0YtwmKdcia0YfdLvMiUF1UHkN2//HLsO8YP+Ij8g==
X-Received: by 2002:a05:690e:12ca:b0:640:d038:faf9 with SMTP id 956f58d0204a3-64436fab5f7mr7781946d50.25.1764945484906;
        Fri, 05 Dec 2025 06:38:04 -0800 (PST)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ae638sm17499737b3.4.2025.12.05.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 06:38:04 -0800 (PST)
Date: Fri, 5 Dec 2025 06:38:01 -0800
From: Richard Cochran <richardcochran@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: Fix E2E delay mechanism
Message-ID: <aTLuSZugpZDNCRzf@hoboy.vegasvil.org>
References: <20251129-ext-ptp-2v-v2-1-d23aca3e694f@altera.com>
 <26656845-d9d6-4fd2-bfff-99996cf03741@redhat.com>
 <aTFuJUiLMnHrnpW5@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTFuJUiLMnHrnpW5@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_063806_724943_AB885E5E 
X-CRM114-Status: GOOD (  11.50  )
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

On Thu, Dec 04, 2025 at 11:19:01AM +0000, Russell King (Oracle) wrote:

> Basically, the conclusion I am coming to is that Synopsys's idea
> of "lets tell the hardware what _kind_ of PTP clock we want to be,
> whether we're master, etc" is subject to multiple revisions in
> terms of which messages each mode selects, and it would have been
> _far_ simpler and easier to understand had they just provided a
> 16-bit bitfield of message types to accept.

Encoding the PTP role in the hardware is a fundamentally stupid idea,
because it makes changing roles (which is a normal and expected)
impossible without losing time stamps during the transition.  Some
early PTP hardware designs had this defect, but vendors figured it out
in the second generation of cards.

Thanks,
Richard

