Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600A0CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 16:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEnwrOV3MXxfnmmoGy1WCr0zVelqqHdj4W6eSVNaxZs=; b=e33TYa9bHnXsaZiHEX79QD7D9E
	GjQIZhu8soyzE0E3iaBXbkoYZHaNfWo7rOsSOu/pQrh4mumdnzZMK4fxIvP8b6NzW6g+uuvCoNcTE
	20vOcwVTUJYkcvA7QvuQiA7OMFL1785/6mEHtSkuTMNEF/BaDXb7D/y91WXDJsJgkxfZP2h89bcB2
	I99Ihr/v+P1gldeMFL0wkIOKzMZ92Z1lzq/Uf0h2fq+9Pva7lTFt1UPelawaNf2PpxKoJBqLgKkkv
	k440Qen0hZI+tliGLaGxapTcFeW43T44ga4YnAWYC4aCnYaBUJp7cVfuyMmhXWiTztScuJHG5kuYI
	HztM8R+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuwFj-00000008ABR-09iB;
	Sat, 06 Sep 2025 16:59:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuvjK-000000086ql-3qZB;
	Sat, 06 Sep 2025 16:25:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-24cdbeca71eso16883255ad.2;
        Sat, 06 Sep 2025 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175934; x=1757780734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gEnwrOV3MXxfnmmoGy1WCr0zVelqqHdj4W6eSVNaxZs=;
        b=nKQ90sHxsveghVUfGPJ5vABC5X0iZrdf63BL7YXj7Xxrmdt5wthSXSDmq2uoe9SsZj
         gN0QjHj4t9HCvX7NhE5pS2Am0PcRf5tmMyFOQzSaMe4mmGsQbKd+26Z7LWWQp/T+t5AK
         gTxHtv7veTigsR2Ax2bJTj1MIDqefMllQLt+Tteu0cqJa1SqwZiMi/XCh1pWoKkcUpEh
         GqmOBsTRVILaqet/7xcz9wL9e9Qb3r15q+GM4GFG2oUVl4C6nESFamZOZT6SciLSTI5B
         H7+wR7IQZV6BU5yKOMctPs/rKn9Eyl0f0BOVDDv4izENqO32z4m3lriyydRV43TKc8JS
         3Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175934; x=1757780734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEnwrOV3MXxfnmmoGy1WCr0zVelqqHdj4W6eSVNaxZs=;
        b=evs4Yabm6QspvXEldjRIaTTvjo1LKYofTOJ8w/5vdM9WOPBfGmsEe9U+6Vi1cu8NLI
         KOj52DVGREIT/vx99oEZkLYODm3N8euQOvbqf8XIjdoUAhG2tMzq85IG8PupPpm6lZPX
         anBwH/jYsr93fVhqp/HwtKdWPi5WBqCR3VneYgSMMk2SdQbSRqilEZ6nYGwJTonXw9Q2
         b9F8bqT8mRb2iQqNh328FbiEvKshMhrDWKwU6TEowweDQYOvVU4M160jx2cFRV/2etVp
         Xil9+QisAS4OXuVc5a3+GfgXEP7qLWDzY8luQVoBStQ/VP0xNAAhozaeMFn1mkVSzi+D
         ++Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUlid3KQMWqwOG7K04hDEYhCje3xhNP6tJlnfUfcTSHZjAFD7wXHzDGyc+sLUUY38Dl0XFYzSQqUTyp2q4/9fZF@lists.infradead.org, AJvYcCWIS4y5g1eW1mZlxaG1WUMRl2DB0XncNmRPDYXTdvZONlzrzd9/1z+ktrCFIw83G3yqXT8K+02k7mFI+cmUkAQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZdyjmSPAGrUC+5vi6oi2mdZoUGxGLKyEWp+nYEooS/6b8+O39
	3IjW6Vtr6ZwT3ZusNY4F/CahV1VUEQt+nZKx3DBifm+60NNf+WhtLRNc
X-Gm-Gg: ASbGncuxCPxYPCwVDrSf7oprfF8G8HZGCpGBQq7QKXxEx2NzDchG4BId0jn5FlvQslT
	d1czeAQACd2Wo3pjxhp+tHP9eJimqTF8lL6NSkt8yXQnO8SAnq+ozvUB3hsewAfWFJuWY7Yv2d3
	x3lclzGmJAffKKirX4lKgdwxwBsqC0+LaJZvtgDGGFNKK1ebz4NXJM/8gEgwUjvjObkueTySyxH
	chvc9PZUDqoVTryUiObsfyUxWuI4dqGd72I9GIU7y5JTbACzQma6tEhYuyeNQwP3px6fS3CB9ls
	/fHfhjdRCgHM0OXarfTk7lc6VEwXOsoQsXR+G0baJ1692xOZBSIFtzTGLm4u0YdMWtexTuJ3Zeb
	QlfAIBpHP1DXVq46vQepM4WWHb1IlgZrIt0c+FIdczJ3k
X-Google-Smtp-Source: AGHT+IGUGHGUXwC+KGN4jPZ3eUoPjDhKK1q5TM0NAklHLJQagkflBBhklqliToGCEeYKq03hd3Y0tA==
X-Received: by 2002:a17:903:2b05:b0:24c:a617:1185 with SMTP id d9443c01a7336-25170c477e7mr36953315ad.29.1757175933847;
        Sat, 06 Sep 2025 09:25:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e08d:5959:e7ec:1beb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm67193645ad.144.2025.09.06.09.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:25:33 -0700 (PDT)
Date: Sat, 6 Sep 2025 09:25:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] Input: mtk-pmic-keys - MT6359 has a specific
 release irq
Message-ID: <odrofximcdjjwwowzlpheug5t4pwx5gylfyzr6mqcb5gz3vtud@c2hcoac3svyx>
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
 <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_092534_976238_B27E43D5 
X-CRM114-Status: GOOD (  12.48  )
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

On Fri, Sep 05, 2025 at 01:51:58PM +0200, Julien Massot wrote:
> Support for MT6359 PMIC keys has been added recently.
> However, the key release event is not properly handled:
> only key press events are generated, leaving key states
> stuck in "pressed".
> 
> This patch ensures that both key press and key release events
> are properly emitted by handling the release logic correctly.
> 
> Introduce a 'key_release_irq' member to the 'mtk_pmic_regs',
> to identify the devices that have a separate irq for the
> release event.
> 
> Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Applied, thank you.

-- 
Dmitry

