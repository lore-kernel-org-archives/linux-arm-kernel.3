Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597F1C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoTiwV/penO5v76PscVulf4a30dmwygkJIwyLi0333I=; b=0MHG7jQ21Sfa9qASzWvoNF8On5
	J88sL0X284pEXbuVr0IRBkScWpVjsxYMVdvyM34NnKd9M/WxbOThGT0udjdeTrsuZ6umAGoT8anjD
	3ih4wE+HCGGuz4lW/omL65fWDtHL4wl7FjpIiLHA22JEVHFwlmYWpXdjN5vvaTnL5ULiTyUe5K7HO
	t2f1eHXTlZOFULAh/TkhbhfDxT/l4rR/QwFFSj3845d1hOtqWqIfSdJo4Fa4ywkgDf7liVNUIvF+H
	x6TBpcS2lOlkZwt9tZ7NrPbvKbViD/71icZs0ILmsba19PjXo0fT3fmBfZRnhcEaiZfKR9f24SOLR
	/ihfY9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMbC-0000000CoDN-002W;
	Fri, 07 Mar 2025 01:34:02 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMGU-0000000ClIt-3xX0;
	Fri, 07 Mar 2025 01:12:40 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c3b44dabe0so152673185a.1;
        Thu, 06 Mar 2025 17:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741309957; x=1741914757; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RoTiwV/penO5v76PscVulf4a30dmwygkJIwyLi0333I=;
        b=FbDGd7qZGUz/wi9shM766LI02KxwPmOf6wUIpQUu6q8dah39vUXw9H3qWyok6FcPNA
         kcHTzNacCeyVsbTWMYLpVAyN0LiQARa6EH7qFWcyfkIZOF4dLWoAeSUbN80jBhEjwtZz
         wn6KoPcF84unJLfB1dcSqK2miMUBHIJni+klBWX1GHckRkKSuVgz6wvq/3uXMO3ibavT
         x+bHBg3PmIZrR9zRfMiLKjA1B4vlIf8WlTnt/1iY4DdTaYGsk9HRTZwgwRnQ0ZmE6rBS
         jOzPqx3PEejfXmKqa9kCsTVJhUJqjmc8A/qXW4KH2SJeFOVFjDG8IFlnixGbVvUXs/9A
         UwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741309957; x=1741914757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoTiwV/penO5v76PscVulf4a30dmwygkJIwyLi0333I=;
        b=C+3Z4XxYAsO1kLjEc2rqj+Urdd6d+DR6yGzwqV+1bCdWvZ0ePO+I6uY2goMO5tPLj0
         o+CunchiJwOaEU8UjqskW1sqPo/RuPX+ybi410pKkyrB8Iq3uUR2DKpSAozlLgnSjMfs
         xT6rUmUmrGdSHlr/KnsEW1usgc+1iEP1yMBX6s8opPiIPUcmCEjBkSAjflQIl0gmT56l
         8onH56Aba34VGg6D03aVCAoD7PEnYqTlTB2eVDAi2/VYBMBCOzhVoiWZY50wrGaF6mbT
         YkcAJmPNF/j2iYn1J1UFWmFPBzROmGjMa2UpmPz22HTzOsQOhABcVjESuZarDjro/JC0
         BhcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7rnDxW2jiKqZ8H8GufVmUdPZ6FEkZVbDHeQqb8UCsyGinfQbD4zw5P7gNWFHtNljBWqjCqy6XEb6fWjA=@lists.infradead.org, AJvYcCX6Xz3tryeg7i7EsnMWX2nWpPiMhy9mNlhKPQw7+n7HY9Gp0+mz2iL5X9qlStTJU7YUjjqafOvbJw64ysg5q6Gq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9VPG01eU8M6UuG58B2oz9NU/FDEtkx74TfQ22rveyDL+7TgoL
	d5ZdPHJeAYJ3ZIHFgVTG5pZOG4mTkrxYFtonL+OCN5D9C9e/3M1O
X-Gm-Gg: ASbGncu3zZ83jDpXYE4z+P37+h/TFcOPi/DVGNhx/7rxrvl2AFYTIJLvvbcengWAus8
	sCOtNn81FP/fb5e8Eg/uRABD6L9rsiCvPZzhXASpqprhRp22ZtlLyah7vdzLmTJhhKORN4wddQL
	rL2xlxK5Av3ExKXQKPsqnCKU/NQiJT2x0sRmDmz0wbsJ30WUnSkdpSrE6SauqxV/qo+xdP78ytK
	gOsDjtJAoSX9Va3TCfb6PSPHBkOhlHU2xFLcdOY/KS+ULdVmCTRzXwEtCl0vw9Mvqt5rCuF6jOB
	JqbRnqJxdN/vr4nmBhpP
X-Google-Smtp-Source: AGHT+IFUBVq3F43PYm5XLqPTMM7AQh1lBI2X72APqLeXMYlSNYjEqY6EGkejol6T0++oyIAOjKb56g==
X-Received: by 2002:a05:620a:6607:b0:7c0:ae2e:630d with SMTP id af79cd13be357-7c4e168299dmr213772785a.16.1741309957325;
        Thu, 06 Mar 2025 17:12:37 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3e54ffa6bsm163770985a.80.2025.03.06.17.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:12:35 -0800 (PST)
Date: Fri, 7 Mar 2025 09:12:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Romain Gantois <romain.gantois@bootlin.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v6 0/4] riscv: sophgo: Add ethernet support for
 SG2044
Message-ID: <ptq4ujomkffgpizhikejfjjbjcg44vyzw4pwbs7kureqqndy6e@alxgdc3qkm7q>
References: <20250305063920.803601-1-inochiama@gmail.com>
 <20250306165931.7ffefe3a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306165931.7ffefe3a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_171238_983930_8E87D95C 
X-CRM114-Status: GOOD (  10.61  )
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

On Thu, Mar 06, 2025 at 04:59:31PM -0800, Jakub Kicinski wrote:
> On Wed,  5 Mar 2025 14:39:12 +0800 Inochi Amaoto wrote:
> > The ethernet controller of SG2044 is Synopsys DesignWare IP with
> > custom clock. Add glue layer for it.
> 
> Looks like we have a conflict on the binding, could you rebase
> against latest net-next/main and repost?
> -- 
> pw-bot: cr

Yeah, I see a auto merge when cherry-pick here. I will send a
new version for it.

Regards,
Inochi

