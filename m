Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8615EC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JX4mrNACU5QqiYMm/oWkTJ9YOn7pmJRNtKmkF02gE2o=; b=EgLSgSRcTumuZDpi6SCG03UdWL
	zPfwy4nXQbHnhqzWJDY9EFgOXJr11Emp3WuFiOSwbpCrimi1Hk8n02j/bF3gi4dEMQuvKPZM+/VFj
	BYEvg/1kmAg+O/obA+q7Aq59fwy6nykeAA0mNYJhqX3q3sB2I4AFOgKHFk9lgI/NpNv7wMZfjuGO5
	r3hGfGb5jEwSgaBEjO19bmBk9cuXZUEFRv92gkje41ZftZsWW2MgROoFiSyhmPHdkiVrhixw2ghef
	jy+Fogxbwdg09tcA2w7ESxyaPIo5nWyqGImNjGeM6alV7WfNWt+o0RGT+2QkDXXdnrfclkDLP4zvs
	BUrFFNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lg-00000008FXO-3LJY;
	Tue, 10 Jun 2025 22:48:32 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP414-00000007qGj-3OnZ;
	Tue, 10 Jun 2025 18:48:11 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso75181241.0;
        Tue, 10 Jun 2025 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749581289; x=1750186089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JX4mrNACU5QqiYMm/oWkTJ9YOn7pmJRNtKmkF02gE2o=;
        b=QRru0EH4aijtTWgUyneQWzyLRkxESjFG1OpDRXdqwZ2SfUMp4pUGfd+MFeOJYLoWfd
         ch5jthyWWM3Ps55OrlJ7zSUtOAkpDlvhggTZlsDTVmT0j3tWoTOBKzxrGVXq6kyY20yt
         y8rj6ZUd9x/1zfWudHr5GM7iAU6BkUmkF5o0vp+pWEZZ4POAg+62l1OK6PDlibwv2eDZ
         8GXigqx5v94wpu+TELGojUhgPh+81Astkb+SEGo3EeEU26VmfQumWAbCzZTX2zYL55NW
         WBGZxiMj6a2rGvb/0JsdQ6YCup6SZotRAflMEqwImEdWE2mIJEpJgs/EP6yvDamn0xXs
         84Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749581289; x=1750186089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JX4mrNACU5QqiYMm/oWkTJ9YOn7pmJRNtKmkF02gE2o=;
        b=cHY48NZrXPrf/BW351YUzk64lGQSBsIPbzxQgvd979I+dI4XB5K1o/UaZdlaAFXXqz
         q7Z3z+goMfCCCe/JLvvtkiHWftu8fgHJrv12cB4/uLDJ/rHOfnDS/IPvM/WN+3gWEpBy
         4atCoLvbuHMJD2MPjQmrjfpss1yf/Qh2FC1NbOTpFGETfFCUxyDqWFWQ/PuLOPasNUsh
         Vjlfxo6bHPaNs8vPrFE+omuf0w1807MxaMzvDwhtuuWLnmd4FYm4wetqfVtne4hRH/DD
         3WTgQefeh5EJ/athhYa6cwMpDHro1UnlpTu6LU0a5vndRGWh8vG4VvdKgVPaRPQAuRSv
         reLg==
X-Forwarded-Encrypted: i=1; AJvYcCWXV3/a1PswkLlX/KuDJzJ+OwsGlAx+bjbCw/05lK9GH3VC31WLpXIbAcvAtD2H0yk1VnVCPdsY7apHahhThh/O@lists.infradead.org
X-Gm-Message-State: AOJu0YyHXB0vGzJFx5Svzc5kpcmwFgHKdoCvjZeeVvXtgGhnnDWsdJS1
	UkzWfKgJLE/Kr40U+B8rF8qw8XaLpQ0rQo885SJzgKTXkL2WN2IMFUzT
X-Gm-Gg: ASbGncvSQZ3E4J/faHmohfC9DlRTHZSSn2OR5ohAj1DjoRQ9vM58xv/xUwLqvy+P5OU
	zyq5pQwCuPtEk2B6QIc+NrUVpUBSq/g5ZDpGHTteDsZUUFHI9qjiKHaqvECRIlIhrhAoQgEjKg1
	ybosBhaSCnDMXFUgTNIyg7VnXDCrxwBJoz0HLEBm1faHI8m4dkr8nGDm5QEoWywtbcP4ROCgjUq
	khCUSZku+5LSEPjb740xU5gpchtMyDR07NS2YXYXOoduU32igg6XNVkw1+fau9Be3pLam+WYlA9
	A+QhubKnH1F0gvnaeBObT2SU5MoEO8JjR9UIIY0vUd/m7muTUg==
X-Google-Smtp-Source: AGHT+IGmT7wJcDq68+XcDGJVWcLx9IDfGN4qKAUL1yE3GxYgT8Php+JzMKRe6suO938HurboJxs2ZQ==
X-Received: by 2002:a05:6122:4598:b0:530:2c65:5bb8 with SMTP id 71dfb90a1353d-53121d524f0mr973900e0c.1.1749581289454;
        Tue, 10 Jun 2025 11:48:09 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5a56::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531224b91aesm162867e0c.8.2025.06.10.11.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 11:48:09 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:48:03 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <aEh949r9mwY-R0XD@geday>
References: <810f533e9e8f6844df2f9f2eda28fdbeb11db05e.1749572238.git.geraldogabriel@gmail.com>
 <20250610184449.GA819185@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610184449.GA819185@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_114810_845353_878FC872 
X-CRM114-Status: GOOD (  11.37  )
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

On Tue, Jun 10, 2025 at 01:44:49PM -0500, Bjorn Helgaas wrote:
> This *looks* like it could be strictly a move of
> rockchip_pcie_set_vpcie(), without changing it at all.

Hi Bjorn,

yes, a move of rockchip_pcie_set_vpcie() is needed for re-enabling
power rails, considering patch 2/2 was also applied and the regulator
is not always-on anymore.

> If that's the case, please make the move a separate patch so it's more
> obvious what the interesting changes that actually make a difference
> are.

Good idea, I'll send v3.

Thank you!
Geraldo Nascimento

