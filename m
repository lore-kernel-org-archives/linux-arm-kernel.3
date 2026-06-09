Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D24BCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZiTcIzf6mchD+iirvn2EBbk408ewfHKzsbm0mbDaVs=; b=02rGe1Bjv4Islrviqx+t5WQhjP
	xveyHpHusytUBBpirnJG3W567ksQ3wXHjaPp/FqJN8cQ+vGL/5VzPRdl0/dLiZt6cldhVCCMd54xT
	DgFsms5vfAD4mG4vpTy3N8SD3Fjn3AAERaXjZ3hlsPOQan4/t/8ltTFIzJN/o9IWd2t2VLoKOW/yV
	ut4OQtE6pliB2Xo3x04kwmPuRJ8++KwoXzZffEugqcNplsjD3Z26KV17GHaZ5Nw/121ZKeOD2IfYy
	NMyGxQWGRO4BSF5j0s+ZKfaH5KdfIAqo8QpjZi5KOIxXDUWc5aZ1jqqWMABXUk9mIaaOvmrNzQv+S
	NbZJQq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsJr-000000058CR-39LI;
	Tue, 09 Jun 2026 09:00:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsJp-000000058Bw-2f3a
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 09:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aZiTcIzf6mchD+iirvn2EBbk408ewfHKzsbm0mbDaVs=; b=ECOfL56F4uyoQueWqyA5CD88LJ
	9itUOoc3j2gj9kTQSWazNLFK8kRt371FNW1uJe4fVk6dLFDO7N2PALgXH2jVDPiU9+V2rKaqv2QPj
	vt+Yc8MX+A28WqK0HboEBGDRbPsrccm1mpJw8xOXosFVpkzBMrDwt4jbaeZE6PcutiIjYSYl4Dc2y
	03n4LgNGFzD+xiQny5DbMkDIjaEQF1b+VeEbP6bb23GIq/VMlijimmQwI1ilIp4DXlFbttV3bnFw+
	1g4NYO0NOW+e3z46/bQz6D0P3+s8SmtPPTRWlgxvi4sdvqpMxsUK6fpqbWPPquFZHBeOHMdh2CItG
	mjNzYRCw==;
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsJV-00000002DFW-34wR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:00:19 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rkEHLdsMEDbqmzRsttecHIr/H+oXVcOsN4uF7NLNoGhzZO3l57bOaks7sRALomncSAW8iVYW6AmTitSxhwtGMIy7r/NGGfkJWQkN1ly/1pCyI57t7sAaQT6v8ecv2ZrSdMsNLvJXOELe0K+fY7hnzdrVx754vvEXuYvEorn4F6DG45qQ4sHLpaMSdnOdx2mXuXEK+oLBVQzn2FDIgbQyqrOuWjdHsMTl0ggwTGDca/VeU47ij2VUwgHd78ll+XVFDYFqn3Ig7ihRPhNRqVSF7JnqbC3xnOyYTSuYO24i/n983PACf/3E7k0toOq/2El4uLjBYhmnd+2r8cbr9Rc9Ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZiTcIzf6mchD+iirvn2EBbk408ewfHKzsbm0mbDaVs=;
 b=hGEFQRXvjEC97BjEHeajMt8xL0H2tmxbxgrCneG5x7mBBQfqnQ+En/7XWekJqboZTsh05wn8hh7NeB3KsLPlkXwOCxIiHdI0dLZKzj/42tqwnxMATXvmkWQQM+47y9XkyyEJKAyWpHNkatdyyTSWH/PRU5wY6I8hjiF0NM0dknXIplL5rngDh7JUQ6xIkWdMCSQvzTI5WMXI26hApawLjs5ZQX1qB4WfxLxyxnmTlTWHJRJI4tlGWjm5dIbUIgpy6aNSi9U9Q/svhafwiJy9W/ZDXr6swTMB5GQWfBJD1w2jh+h1Q792alA5nEn/2IAajElaNKCsBcqn6u5qDp+dHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZiTcIzf6mchD+iirvn2EBbk408ewfHKzsbm0mbDaVs=;
 b=irPDcEdtPIz5fl7UYeixEd/3ucQzfY0ioMMl52ETeTFTnCASjk/IqiF3u8tp7l+VfpFMS/Ip8RnZ127fcq163n0nTFdRK9I5LZ1auhbK2swRR1io3Mp7rSfh735p6NFpbGJybVenLwyHtOlIir+Wf7idL6EJEMfjmwAGwsyP3zo=
Received: from CWLP265CA0424.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::23)
 by AM8PR08MB6546.eurprd08.prod.outlook.com (2603:10a6:20b:355::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Tue, 9 Jun 2026
 08:59:52 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:400:1d7:cafe::90) by CWLP265CA0424.outlook.office365.com
 (2603:10a6:400:1d7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 08:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 08:59:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAwEVV5O6ahUXeQVvnkQRIWxXAZJ7N879DlGh+GfocwyM0IjpQ34hhdVew04VOGj4p0bgh5Ei+vdDVJmQn2H98ZvFyqQw/LIB0ImmTPq03pp/0ljHD7zD05cuR2xLWyQCWT0YBYPkRDYtbfHWDvGR3n+384BiYbchyST5Do0lQ5RzWWvf4ZwbjcEEwEuK5Iip5aD+X+/ptr6D9a8xvQrlV4PoCw7HurnAPmHDW4oNQe+/GWV45kDaSuKgop5BlNjM+Gmgmfup7UA/s4iM8cpk06+cgU4u6PeNl6mUO4W2ZES8kKQGDUH1IjRfu44UjS1QR8xC66FvvUJ2Ksx/vgQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZiTcIzf6mchD+iirvn2EBbk408ewfHKzsbm0mbDaVs=;
 b=lvkHcsyLKOTsnEHn7EAFKtNuLIsE2mj6aALTiCb40VcT9rFNIUkPYBJO1SwGr1MXSURoV/1UvljE0ARa3mfy3SeQ2rtoJ9PCAPag7IewjdUf8+ue5b+n9AtSOEg1Dy22aJYiG4y2QngTTojS8uV+SuXAydP75wzXjUJw01561Iz1eQx1XUBCZXag6ovWG2l7Mm/gkieQP5LSvzfhu9v7Ft7DdAp5TIBoyHKC8hagXgA9vnTuhrwfmG9ilPuaOAElRtgU5u/HY1Ctq9qaj7c/UiXY8TlKd1a8mOyIUpFoG5TaSDh/Hq49Msyexb23QjaJpV1DDmggzbWcufij8V9Ccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZiTcIzf6mchD+iirvn2EBbk408ewfHKzsbm0mbDaVs=;
 b=irPDcEdtPIz5fl7UYeixEd/3ucQzfY0ioMMl52ETeTFTnCASjk/IqiF3u8tp7l+VfpFMS/Ip8RnZ127fcq163n0nTFdRK9I5LZ1auhbK2swRR1io3Mp7rSfh735p6NFpbGJybVenLwyHtOlIir+Wf7idL6EJEMfjmwAGwsyP3zo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by AS2PR08MB10180.eurprd08.prod.outlook.com (2603:10a6:20b:62d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:58:44 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:58:44 +0000
Message-ID: <44f409a6-ce8b-4fde-a86c-b1ecfb307bfb@arm.com>
Date: Tue, 9 Jun 2026 09:58:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: etm3x: Fix cntr_val_show() to match
 cntr_val_store() behavior
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: James Clark <james.clark@linaro.org>, mike.leach@linaro.org,
 alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org,
 mathieu.poirier@linaro.org, leo.yan@arm.com, Al.Grant@arm.com,
 jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
 milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251202082613.3265761-1-visitorckw@gmail.com>
 <3bec7ceb-61a8-4b38-a794-02ee2fc9e68c@linaro.org>
 <aYAxbbkHslAP9RBN@google.com> <bb521240-ab53-4c5a-aa1d-6b140ed4262e@arm.com>
 <ac-BEX0Rfe9RBJJn@google.com> <aibz51FAJG1neRg1@google.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aibz51FAJG1neRg1@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0322.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::6) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB10975:EE_|AS2PR08MB10180:EE_|AM4PEPF00027A6A:EE_|AM8PR08MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dec6991-e16e-4e59-e6c4-08dec6057822
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|6133799003|22082099003|4143699003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 6YHgtGS/hSWWEU/f4otJToj6no2M7dkZQqph5RzFe23d5GLgedqi1NphA0w84k3cF7alW1Y/ZabMRHW8TYNsiyNg22z0dGC310irBqhmtH+GIzAsiG/WAUuK1DyCA7/VyxvcKMDkXKCuVFG/E6vEvZYwAvmvyqnd6Ckl5Gr2Eou9VRU6JGkX2HTR7Q2UlsaHzQOMRA+IqAKzgpMXPWBIbCOBKVInvAaDGhftwcglUsJR9mxgevuBvyzA7O8whHwH7JQMnwUKpHppK6WnqwV8ejb5e0lmWbvgmQv9iD7Wm5Btyqi1ug40FZLjXfXCkhpdoVY9qAf1gDUkRjBqv1Kn4oJM8E49ok7MqPDISewbrt2OzzI7cQj93KlIZRrloEWAdFXREmu7qQkDVunTW1YERSpMH2yX+kXiNlvbmEZ4jd4OIHYhGG4mZ0NdKs0cfAhA9cJZtW15G9z9bR2temvS/0Zl/MxnOxBzO6RMYRKR1/bmmZPTlwvoU/QCtJb4m8tNaKDO1v+YkQSmeiIzM2lgYZe8xIKRLvcx9cPJ4iZhEw61NOTTM4C1zrIEXZdfkVm9OwKNWibtIr0AA3Ia7giC2toGaOdMhTQ14jk9R/1y66zbeZUX9jzAK8cqO0hwsgoRc5xVXeR2Jbh7C7VRuhup+GsSQI2gdoDk1EcFtamNYEDTLa36Zvpw3qE9J0VjLrploXwOTfNl/Zue5q6ioU/8nA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(6133799003)(22082099003)(4143699003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: kGR/4MxI7paFdG8pT5BzAYFCGEhr11rIp0sPSmienQuL9sDCnVyRMxIkCUWOFzpIwFnzjH2XAJYr9A7M91RUP4+JuvFnvmNsDrV/mi4QXrR4Pi75MTBWWrxYrUht2wZ5YtgWsGaHt7B/CGJI3Irfp/ktNKMiQtG0+wcxWlTMBqVZz0XtuVahkdYc4nBGnW25nnwsbYIKQNTF3Gk5Uhy8IQYZchoIWdPAXElrKAAJq2NqqpMlOq3qexFEL+aXSWmSLpSVlE5mC6Y+LAnRONruTknqLqkrHcBe2j8IvqFgJNPJlAgx3WMfPoFu3YcEJa0f5yu6eCF2+48iqaIboxMmPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10180
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 72adb7bb-d727-40fb-0a08-08dec6054f7b
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|376014|82310400026|7416014|14060799003|1800799024|36860700016|3023799007|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: XpESv6u57XhfHG5L+zvgN0UmWTztDiniKRWgQWYZ+YAFpk6WbIkJlFvL+V1w0JlZNxNVU8m7cEWcMSfUXlZxkQkXe7LlXUGbnQx3QY3Q6GYmiEfpZfrEzZQoofIcRJ4Y4WsMamsv91F+IBxMmmEQBEum+pktL36tCuS/ixPO3U/XEebFw0peB8S9N/Z+ve8VN95FGDe+Z2eHdcTVH9TWjD+BRRYxRxDd80EHMPyiHuKCEqlZ0f3CNvaZmynTPYfoSO8KvX1tX143XZHwCKu5riyIH5F9MviiEipqtwsydADRxDRR0bvSaWl6+cWqBaUDagGMj+GD4nWzw95uZMRY/xazTqG5ecnMykkmsslaWe41Nm9rRZ/7okbsqaQnN8CTVp86XqgGrmTxE6zTtNFXkEdmYdRRfmAw5knUIgMyMnIFAXxQDIANHY0lcs662+6CvO6Vkxc0TzExjOCa6Fpu5qlnF0c3kj3A8rBknbMpZy3ZrDUQXIDOjifHe9wGwjfZotEK6RHEhssKMiu2CV0F3avfMNSsIcrE4KxGhCEqBK/ycLPPKgA51DPYImTQ9OW7iUI/tBxIfNs6ULA9QMffKtDc9Vrey1/l1A8rLgmWos5SwBbMLqp86ct43eGelxpA+knJJW64oh7jXgyLCDwa5v9uSr8XsefuMfIGP8g/I2qMZu1fecNEyB34QLN1KptzF/E5yb9cfkblDM6880t8UDJyemSX6pkz+wfobMF1aHE=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(7416014)(14060799003)(1800799024)(36860700016)(3023799007)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5CQbulxAPTNdb7jVM0EfWHpnir5fqf9gsb78lZ4NOgnELzBdlLs+IDpgReOuQ50ijqjjCyPTDEJf3sJw5MY3dyOMIl6ek+YjsgdPK/HLQgasrgkmVl6gA8Gr94vO7ICvtX3gup5+M2eRHUxd+8LEY+qHzIMl8OLNVXIItXNz+MKVezI219ZchssEJMZ0SfiRMDMOaFxPeKhMu9xdmPuwokySDbEH/TJ+nf31ZAKGBq/xWJZ/gMosqoJ6uB7E06FwdSeQkG8OnMPtNxbg8x1a0wsMS9FZSr8aX/dX1h1iSxRmPOI3HVAURAaAb2HSqJS1WfHnk3eBV/pcsuWL5VkJroYjVa/66L+daP2ekHAjS6LpVnvPllLKGcb8NMZUK4dASt3gCUYwREN2j/fYoL40fU91wq5HTpNSvW0QaD40fKukTBpBM9uBe51XPVEt/+Sy
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:59:52.4922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dec6991-e16e-4e59-e6c4-08dec6057822
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_100017_640840_B1414654 
X-CRM114-Status: GOOD (  24.05  )
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

On 08/06/2026 17:55, Kuan-Wei Chiu wrote:
> Hi Suzuki,
> 
> On Fri, Apr 03, 2026 at 04:57:59PM +0800, Kuan-Wei Chiu wrote:
>> Hi Suzuki,
>>
>> On Mon, Feb 02, 2026 at 09:33:59AM +0000, Suzuki K Poulose wrote:
>>> Hello
>>>
>>> On 02/02/2026 05:09, Kuan-Wei Chiu wrote:
>>>> On Tue, Dec 02, 2025 at 09:26:19AM +0000, James Clark wrote:
>>>>>
>>>>>
>>>>> On 02/12/2025 8:26 am, Kuan-Wei Chiu wrote:
>>>>>> The cntr_val_show() function was intended to print the values of all
>>>>>> counters using a loop. However, due to a buffer overwrite issue with
>>>>>> sprintf(), it effectively only displayed the value of the last counter.
>>>>>>
>>>>>> The companion function, cntr_val_store(), allows users to modify a
>>>>>> specific counter selected by 'cntr_idx'. To maintain consistency
>>>>>> between read and write operations and to align with the ETM4x driver
>>>>>> behavior, modify cntr_val_show() to report only the value of the
>>>>>> currently selected counter.
>>>>>>
>>>>>> This change removes the loop and the "counter %d:" prefix, printing
>>>>>> only the hexadecimal value. It also adopts sysfs_emit() for standard
>>>>>> sysfs output formatting.
>>>>>>
>>>>>> Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>>>>> ---
>>>>>> Build test only.
>>>>>>
>>>>>> Changes in v3:
>>>>>> - Switch format specifier to %#x to include the 0x prefix.
>>>>>> - Add Cc stable
>>>>>>
>>>>>> v2: https://lore.kernel.org/lkml/20251201095228.1905489-1-visitorckw@gmail.com/
>>>>>>
>>>>>>     .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
>>>>>>     1 file changed, 4 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>>>>> index 762109307b86..b3c67e96a82a 100644
>>>>>> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>>>>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>>>>> @@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
>>>>>>     static ssize_t cntr_val_show(struct device *dev,
>>>>>>     			     struct device_attribute *attr, char *buf)
>>>>>>     {
>>>>>> -	int i, ret = 0;
>>>>>>     	u32 val;
>>>>>>     	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>>>>     	struct etm_config *config = &drvdata->config;
>>>>>>     	if (!coresight_get_mode(drvdata->csdev)) {
>>>>>>     		spin_lock(&drvdata->spinlock);
>>>>>> -		for (i = 0; i < drvdata->nr_cntr; i++)
>>>>>> -			ret += sprintf(buf, "counter %d: %x\n",
>>>>>> -				       i, config->cntr_val[i]);
>>>>>> +		val = config->cntr_val[config->cntr_idx];
>>>>>>     		spin_unlock(&drvdata->spinlock);
>>>>>> -		return ret;
>>>>>> -	}
>>>>>> -
>>>>>> -	for (i = 0; i < drvdata->nr_cntr; i++) {
>>>>>> -		val = etm_readl(drvdata, ETMCNTVRn(i));
>>>>>> -		ret += sprintf(buf, "counter %d: %x\n", i, val);
>>>>>> +	} else {
>>>>>> +		val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
>>>>>>     	}
>>>>>> -	return ret;
>>>>>> +	return sysfs_emit(buf, "%#x\n", val);
>>>>>>     }
>>>>>>     static ssize_t cntr_val_store(struct device *dev,
>>>>>
>>>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>>>>
>>>> Thanks for the review!
>>>> Is there anything else I need to do for this fix to land?
>>>
>>> Thanks for the patch, I will queue this for the next release (v7.1).
>>>
>> Just a gentle ping.
>>
>> Since the v7.1 merge window is presumably opening in about a week, I
>> noticed this patch isn't in linux-next yet and wanted to send a quick
>> reminder. Thanks.
>>
> This patch still applies cleanly on top of linux-next.
> I suspect this patch may have fallen through the cracks.
> Would you still be willing to pick it up?

Apologies, it did. I will pick this up, if we have sufficient fixes,
I might send it as fixes for v7.2, otherwise , queue it for v7.3

Once again, apologies.

Suzuki


> 
> Regards,
> Kuan-Wei


