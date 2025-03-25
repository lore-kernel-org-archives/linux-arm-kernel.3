Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF8BC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytAAvQ7JGlkRy9+sQoqDV7MKxsmXX7OMGSm/op62KLs=; b=FjdGHh4FVdn/Pj8ne4qKucTKcD
	BIfP+yFGi3+RcybJ68DbXrCpGadPLYhzs5rnHqohNOsqmjnTema6lUecFtlIBgreTqrGp8FpUhxoL
	jfB8tyrilY4N40RZFiFXeyENyKURb2Htpe3wVNusesFVdOs7MwT4GLt7L6FzZvy3qtCD3EMYNVOY5
	HNWlwtEpywJEhRC6H7waG8YcL98Q2z+SwgrQTdSaC3JigC4hRJLvwPJZ/k4AMdMUDOk2VH1WRtYvT
	FfEx0ycnKJIS+iY8vShiMBpMb2gc619MmALL1R0sh+KDZ18hHQFAcr4CA+MtD26ceMVACpV0LCDlj
	aGK2auDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3yz-00000005z00-0Esi;
	Tue, 25 Mar 2025 13:06:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3xF-00000005ybb-20Uh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ytAAvQ7JGlkRy9+sQoqDV7MKxsmXX7OMGSm/op62KLs=; b=LU4ZsuZ7pnbxrK6ztXDLoBjJ9x
	axi+3UAPYAGlS6q3BgTTs7hmJ+O7WwpO9CNufF88rDgThqFEutYmdHKsnfM8O4M/Amb+Hkiw/Dn8F
	CE7XrKeSutRXJYVY1W6VLLVjAWQ6pT2oMZ7ujlb8Q9ToKgbLbgJNyOyJmagkxrBBbiYZXdKbb5Epv
	sxU/y4M9PYTlVyLEB5H3aDEwnpKPZVpH5VCCVl9WRnyBi6gWR4t+7vnypcG2KcPcQcSt7TPNyXghR
	dbxvR0PdtHq+ei8tr4LLV1dLvQsEs1NCmfc0jckZ436wbCLxUpYY5IRhY43S+LGNiiPR+4C77zRmx
	7cnl08qA==;
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx3xC-00000005RmX-1LCz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:04:28 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso46900156d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742907862; x=1743512662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytAAvQ7JGlkRy9+sQoqDV7MKxsmXX7OMGSm/op62KLs=;
        b=RuRcwPtO34Zh0ZvzGwYNWgTI5N8CRWF34YwZuK9exwscOsFd50/qCfGi7N117pir4y
         OXvPH4Z3o6LWRjxJpBKgxnZFmitakErdeuy8nVhoMjcoTAa102TzskhRMqopK3OdSMtW
         lICG1bBBW4Wi8ccp647B/aSYJ85RZdoO+ogSEy4k2GlrfJbOEfgiyUHdvLuQxEm/L5k4
         FShB2joh/3JjOGFzuEBHjpO2nGGsDOWiH+n9SCNd3lrrA+Hnwfu6w7YSpHbvT94c71gx
         rUPHl+qQHY71IGk5krB+vMRFqwAl1xb2MjuLg8Q7027bemO6AzlAPkzFZGqVQJDN/Vil
         LGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742907862; x=1743512662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytAAvQ7JGlkRy9+sQoqDV7MKxsmXX7OMGSm/op62KLs=;
        b=QWJC2FG02MWelJ2r/catTRKPwbtkCli9GoZXtwdnk8n2DzsuJiC332G6oNEhJEz6TD
         yK4Bl8LV5lNVn++MUMuU/uguk30RDAovqhg+6vjVxJRNCs21J5nQcUzWsORzVD2UNTSH
         HEY7PvluMGP/hHmMvQ1kKP2nx3k0JdB+YwxXVWFqviNDoLuIKoWRrPtH+WX0qDWA4QPa
         njarqsFkSTl2w1sE3I7o199ZdNm4G8ZDHG5FR9oN+JIM41BdcUJ+/UKqL40X+KMqKO3/
         xs/LCLo8t2o9nBWK2Ewtjix8C/kYQtQ26zvHZebxHMEPM4QtICDyQ/EgMGBe4Ec4gDH1
         ANfg==
X-Forwarded-Encrypted: i=1; AJvYcCX3ikzAyYHsBm7h3oHPvObZ8rMLrTP5neNP2zftFbJCghlCTGMwIaealGFRCXFhqdRDbk/5pNbINZY5oBKS+jJk@lists.infradead.org
X-Gm-Message-State: AOJu0YxP+PqsWS4kxQqy89kbpfKHdOERJ0WHuxIjYLA291XBVRXkXwgc
	J/CU25msl9ps2BZodsY7Po7blPAPC8aJdVWJdHrBwfRZo9OwiuEsDgUNBhsLemaxFWk5EeDUDnI
	ZGuuAn31gHmMKcFYxpI55w2AxrJM=
X-Gm-Gg: ASbGncs+ilbH/HAqrpMZhViZkCVfqnrnJvQfIg2yZd7XgRo//KWTIaYpC0xCFLXo5F+
	VLEE9HZu7qn82ORd5Me9fy5Xrj8JHj7L6g8A13hDBLX137LnvzjdeqouzFGgRiTTj6p1mcl9k95
	IQnrCVSU+mw7gtZxZ7AcRi4+mJcYlj03CLN7kCQXVEGQ==
X-Google-Smtp-Source: AGHT+IE51PXGLgkSnQJ98M/ddGNci74PQXWvqk0kA+jVT/PXCPMy/JwdbENsPVcSNY10HlA73yPF/yQqtOeqqz2rqvE=
X-Received: by 2002:a05:6214:2607:b0:6e6:61a5:aa57 with SMTP id
 6a1803df08f44-6eb3f2937ccmr297309616d6.14.1742907862103; Tue, 25 Mar 2025
 06:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
 <92772f63-52c9-4979-9b60-37c8320ca009@web.de> <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
 <7332ccd2-ebe6-4b9d-a2ae-8f33641e7bd4@web.de> <7afcbbee-6261-4b2f-be14-a3076746d53c@prolan.hu>
 <26e36378-d393-4fe1-938a-be8c3db94ede@web.de> <CAGRGNgU7t85oG3Bq7L3KjKUAbRyd6SHSM6F6BvmdXDVkbNegKg@mail.gmail.com>
 <bd7b31d8-be25-4dbc-9a81-4b0cccd64798@prolan.hu>
In-Reply-To: <bd7b31d8-be25-4dbc-9a81-4b0cccd64798@prolan.hu>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Wed, 26 Mar 2025 00:04:10 +1100
X-Gm-Features: AQ5f1JoI1ggKA9Gw7ELv7T2TUC8A9SzwWIQijK61-mP9ZJ-R-qeFWsNR8IL_vmU
Message-ID: <CAGRGNgVcPRJB+sx_5g-+CLJih4vTWU-FrqiRbvVQ07219WBZPA@mail.gmail.com>
Subject: Re: [v6] dma-engine: sun4i: Simplify error handling in probe()
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_130426_456614_180B7ACA 
X-CRM114-Status: GOOD (  12.17  )
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

Hi Bence,

On Tue, Mar 25, 2025 at 11:39=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.ben=
ce@prolan.hu> wrote:
>
> Hi Julian,
>
> On 2025. 03. 25. 13:20, Julian Calaby wrote:

[snip]

> > Bence Cs=C3=B3k=C3=A1s, (I hope I've got the order of your names correc=
t)
>
> Either order works, Bence is the given name, and Cs=C3=B3k=C3=A1s is the =
family
> name (surname). Hungarian and Japanese order follows the scientific
> "Surname, Given Name(s)" order, but commas broke many tools, including
> Git < v2.46, and b4, so I switched to the germanic "Firstname Lastname"
> format.

Thanks for that, I'll try to keep that in mind!

[snip]

> Lastly, to all other adressees, sorry for the spam. So let's end this
> meta-discussion here and keep the rest of the conversation professional,
> reasoning about the technicals.

And this is why I was so hessitant to step in here.

Getting back to that, your patch looks good to me and it's awesome how
the devm_ functions and their frends can simplify things.

I'm going to point out that this does swap the clock enable and reset
deassert, but I'm assuming that is harmless.

Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

