Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13F9C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 07:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAlmZE5sqJznz1ZOVmY23rTj5suSZitJAP3G+ySumjg=; b=lxgFZUlQHNGG5e7FotD2SpijQU
	06mz9qyQhTQq4zol+SfnLCGDb5VAfudHVqlwvDlh2h/fMosDVuKhA78Vtcch2M9OsJ2Ucem3j13v8
	PqyQ1t4tnGk9qEv6e72SLFsYNl42Wl5UbjMQ2qkzu+uJW4mZP7LJunkNUgpb0831lTpDWvveqDSGb
	mnol/IC+ahCUzybEyCOXAP/vXnHHicbzc98YYTkZnb1QxQh/6LbQgW0t7fd7VxXTdaGJmmr0Xzsdh
	RRF5TZ3DcGHEpLbGKwTFjyzez8/wNRxOux3WQduyk/90JLIrb8znwtLAAGS2xfrdTRDou3YvsoByy
	RYf2/ueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhR1-0000000Argb-1rby;
	Thu, 26 Jun 2025 07:54:15 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhH2-0000000Aq9b-2e2V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750923798; x=1751528598; i=markus.elfring@web.de;
	bh=XAlmZE5sqJznz1ZOVmY23rTj5suSZitJAP3G+ySumjg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bIyahW5mm2qpE8AFH5gjK/utL2agq9Z0N5YZDciofzckFEqc1P485V+T75hcIKN6
	 wP/BuhvfviuPSQPnxp/1cWTuo4QPkUul3fbcjQrml+SXPP26iou4aI22qujorODvc
	 +Crua7nLC+E0hSPzVaYFOVv4VibX2q9YZeUDba+H3gzpYOYO2GPX80uRILWXdMMdf
	 7Qc2+mtc189dG8afRHYHwyicBl/jEA9zRYz3uhV0259jFIhbSgiU60apnOrad5Czn
	 rFf+RQUXgAtblZIG6EzQRMSUDByyvMxFc5d6JKRCyv6QoLunw5w9qkmWSbpqi36PS
	 2EBM+umcUW8HhBJ27g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.202]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7QUJ-1unPVg3bhN-00yIXx; Thu, 26
 Jun 2025 09:43:17 +0200
Message-ID: <e52cb86b-01be-4560-a1da-a6b07108d651@web.de>
Date: Thu, 26 Jun 2025 09:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] coccinelle: misc: Add field_modify script
To: Luo Jie <quic_luoj@quicinc.com>, cocci@inria.fr,
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Marc Zyngier <maz@kernel.org>,
 Nicolas Palix <nicolas.palix@imag.fr>, Oliver Upton
 <oliver.upton@linux.dev>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Suzuki Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 Andrew Lunn <andrew@lunn.ch>, "Kiran Kumar C.S.K"
 <quic_kkumarcs@quicinc.com>, Lei Wei <quic_leiwei@quicinc.com>,
 Pavithra R <quic_pavir@quicinc.com>,
 Suruchi Agarwal <quic_suruchia@quicinc.com>, quic_linchen@quicinc.com
References: <20250626-field_modify-v6-1-200dffa38a07@quicinc.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250626-field_modify-v6-1-200dffa38a07@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0cV8rpMonBMa03MwBG5b9wDd3SivW48JmY+eNd/HyLgmaL/AP8S
 iAXAH9Uq8D9vY9wt+wRclCy3ivXE4uV8zlGCzmw7ySKxlkZP/2I270005Yy7gHXFEU78AMY
 U6qFt30HM15TWA6DjLuv3XHaVAf74gmX1iCyAsd9H+//EyH7lW/TK1UYSxD7B2+VZrCkgOe
 kJvCOI98NladPaZ9nhTWQ==
UI-OutboundReport: notjunk:1;M01:P0:MJqKDaA6sIU=;pJ+ZZbo0sKDE1wfR4GV5UWpoSAE
 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
 Z9jDK7UGhwdiWoeiQlzDyLgvT4Lu4mvA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_004356_965330_E996DF40 
X-CRM114-Status: UNSURE (   3.75  )
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

> +coccilib.report.print_report(p[0], "WARNING: Consider using FIELD_MODIF=
Y helper on %s" % (x))

Would you find it a bit nicer to use also another formatted string literal
as a function call parameter?
(The recent code adjustment indicated something for the operation mode =E2=
=80=9Corg=E2=80=9D.)
https://docs.python.org/3/reference/lexical_analysis.html#f-strings

Regards,
Markus

