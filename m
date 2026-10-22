Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB9606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=liRZUOEr;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SmsBE5tj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jQN2G5XzYjbf7CEtb/68+7YFMGVi8NJFSDqMwv8dp9M=; b=liRZUOErPShRFnoO8qG7X0cdcf
	XYIlXYc4QOgMc8k+rOxy4fiW1UCjJ9h8c10dbKVYykVH1DZ8nGyFBFU9nOJ2pZfhjxg63RpmV12Li
	zgFHCgGsb+WGKGbTJmCIOO6S9k7VMkt4NrvtpRk5W2+oYpWrTfjmf+8KgNz0ct+rzBRNJV2XC1GUD
	2sFxxO3a5qEeJDEpaZeYc2t1bPY99QFtP7Qqzeq1d2pLDEuaqFm7jXGKJNddi2UAQRj0iVcnAyj4F
	TYUN1DB+GFh4EeROgZR9GivAiPjf6m1p8w1oOaM8H9B/nN9CbbizqOD3T+ETkmagD/2b1Z8hqQj2g
	iE9Nvxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyMw-0000000Eod9-3sRL;
	Thu, 22 Oct 2026 19:22:30 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyMu-0000000Eobv-12eQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 19:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHdtecEMUgqIayvaSfEf78KPjVLM6jeEXzwu3BaJMnRUmgglxfopyEeFYkc2QLFxAbbqPEAtdkaC5vrC7KGgrV6NcyCMz4gK5YJsIXckLqvLT1n7+x56UklS31oX/idKdHjnpSojfRERoDdFGOkNz7hAYos975JhOdlKQ1ikbdAd+2quSdPOLds1YCGLgM4BpB3d6QiPW+FJDlZ9jyUXMD9WJ3ktcS+S+/XCD91UgGQcOvzY/uaAbQSibn35vVi1yF4BiJdThJrsEP9C7jOQ7t5xTJtzJQ3csYI1EcxFR1kNkeHc2yAEVASySb3b6oAV4Ww5j3QIlUTAEYsh/JY1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQN2G5XzYjbf7CEtb/68+7YFMGVi8NJFSDqMwv8dp9M=;
 b=TTqEJi1aUaL99fhs17CTseKxHW+0HWkGm2a7qArtazAbPr1BGaLF9Wc7XFgMQcu19j2ECsfVNGcxoCZPFI1J3S1gmRQvf2f7UHbQnO5uFlEDHz6F9vCMdZqiNBijZU/h27Rk3izUIjeN9FADnv+RILoZYA9MzvXkFOhps1vDklAS7+N94ycIWv+6xXj43h2uRT7suGwrSTZLywUq2eVXknG4S1bivPfdvgDE9jdNzHJxUvVs6enDfBmnc5ledtjgxMgIXK9NV1bwX8YwGfzw5QjiuzZLa5xQIF1RDeWhLQGYZJxT0hlAK1mOWkjBVcI9HPAxiKsuQPipsfvigc3qbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQN2G5XzYjbf7CEtb/68+7YFMGVi8NJFSDqMwv8dp9M=;
 b=SmsBE5tjui+74v3wwuvducFopvxCmWtCYuKaiVJkUDqOYExkvukOEQKCRnlmNUFAxBnfjBdVlQ7OCWwKEOpKPz2h+/9vHxw1vQG4Ay6u2Bs139k5XpurKzRXyCK/elJ4oEzXJYyxfWjI4DBR08g3m3ChYDsyVuLS7137w1q1hk71DADoMwngk7GpQSjkNB0/NrRI2KLPpPbfKFbNG6zv5JfKDFDEQ4ZtakcyJVnyxqnwAvRNq+9/XV5mBGOP7KY3RfWmiS8TCH9/h1Cw9y9jl+Eh3fCQqX1L7BcygRsee5r7LZ9Q+qa2+XHCeD7ylKwYcMk5wxo138rjWKeuR4U+WQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:22:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:22:24 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jaidev Shastri <jaidevshastri@vt.edu>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: sm: publish the protocol handle after the ops pointer
Date: Thu, 22 Oct 2026 15:22:15 -0400
Message-ID: <179269689933.1238482.5892325731136888957.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-mb-imx-sm-v1-1-39f17526d253@vt.edu>
References: <20260921-mb-imx-sm-v1-1-39f17526d253@vt.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:510:5::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM7PR04MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc46579-5f66-4e68-7070-08df3071cd33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|22082099003|18002099003|3023799007|11063799006|261009223027099003|10067099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info: J7Q0PZw7Wem290cISPRVqXflrrgxdJoSM3ZzGmmk2Uh6w4kCj1tIy9pU1PTkJQAUt5RNeU+Mgt2ptwVSzEPm8B8nikSho5WHlSWRAQC2WubbvbbHTMlJZZxO2rIzJF+H1pFBh0z2Er/npcrYKOm1M+zvuxpFIhCO+zu6N3hEYtUV//MLezVkgc8gyC9Dd/NEatOM0zbAd34sPioFrGpcMuqxM4lz/0JpTp7qtVO7mNsy1R1ph54xyMGTzC6j8TVhvEKEfoPb9/6RFw40WVnqxKyKJ1bXAtsXurpaDmslpeWuh5u4LOxa4Fo9aKBDlEDjJ5HDWaOhaqIZIAEtIfhi6nT78Y4m4O5JPWDLvZBC0JqCdZA+rX12qmhFKKm/gWfxzkrtm3T4tmLfjAO2JNICzXhYKCvZGjoc+PBcZRGioKDKXGL/5S+TzFijH7UY0VGkRjZ8z5veZpsm59iTGAAGVVgw4A4atCNhUwjFFjTvoXzMT+sD9n4dn/4wvQQf1FqnQeug7+YBSLqGKrIho9wc2N1yCMpwYDI3BcAL/YCSJQPAYex4hnSugl1P5Plb5pWkHJt1UVi5cobaRsBGg3Qf2K/eDYcY8SXnDh4kfs1u3STQLXi0WGsGDuhgF8vGSI2eDvfITEyPnG8HKbtuU9H04h1TPdUC8SP4JBLSJQNYxmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(261009223027099003)(10067099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTd6aVF6TXU4Q21tOHg4QlJQYU5GMnZYanNSU2tkanh5TVVlR2pQeThQWEJz?=
 =?utf-8?B?NHFPTTNhb2U3aDFSUU9JcW94ZzgvdkxTQklLNWM4RitmSmlZWWl6Q0NQeURo?=
 =?utf-8?B?UDErdnhJYXRkODlVTUJBUXhRc1BZYWh3cFpvbGdRc2NpdUM0V1EzTTBGUzdq?=
 =?utf-8?B?dEp4S2trMFJVTlRJVFpQUTIwRlpnVjZEN1doZkFsMUJhZUJZRy9zUlFyTmtj?=
 =?utf-8?B?eDN0aTRwMVIzUXRhdUFBNkFEQmZWYVZDZzlnQnVpZ1Fpa0pMOW0zVTVBRFFP?=
 =?utf-8?B?VzBSYVBxdkFMSGdOazRQNFRENXVPYllXQU5LN0o3c2hka0tDTGdSSUM2SS9s?=
 =?utf-8?B?cUxFYnJrSFlIMzFrN1B2RVZLdlNLTGs5SkpVMEtsVU5aeEt4Z1FFaWZBb1pl?=
 =?utf-8?B?SU5VT2VFUU1xaWNwL3VXTlpGcGJ1VmFuSit1MW5IQkZpNFVmN0NhUGE5eEhH?=
 =?utf-8?B?eXlvWVp1SHE1Sjc3dWpvOTk3WWo4WXRGQlhwVDVXcEk4b0dicmsyRzBGOFBh?=
 =?utf-8?B?c2FiSlN4a09JWmgwZEJXcXY5TlJSaHN1NmkvSzZ0dUlqdXh1dVIrVVQxVlBt?=
 =?utf-8?B?QStYVEovdWVuL1hDTmxpekRERHlmUVJSWkZXOG1LdkZBSitodlBGaDRxbVh6?=
 =?utf-8?B?YjF3TGJUQ2psc1hoTThldzRxaGRIRS9sNG1vQ0xMQXo4cnlqUEk1Q0FZVHJl?=
 =?utf-8?B?bDdPMDRxQXdGWVVXZmhKd09rbFg1eHJ0eDVmc0RjdFliSlhXa2kzb25kSG9k?=
 =?utf-8?B?bTNyMDBsWkpCb3hNVmNxUkNIMy9INnFiakxwcFk3bVlEYytwUElyRUFkY1dO?=
 =?utf-8?B?ckRwclduUnliQ3lwMTMwbDF3eUY2ZTRJcTBZRlo4RmtCMys5enB1RU9ublFj?=
 =?utf-8?B?V0tRdlF3SHhaWEJaNld5akd5NTVBZG90QWZncmxTUDNFNVkveUsxVTBUMklV?=
 =?utf-8?B?dkRqUjNVTGZzSnA0ZUYvZUh6UHIwekpTWllsYkZiVkE2OTZ1YWFnOHduMVNH?=
 =?utf-8?B?eEMxSGF3N09aejNpa2w1dVlQUzFPM3hNb3JRSW9sbXU3clZSOW14aCtYK0VW?=
 =?utf-8?B?Y2pQZ2gwNnVoczNxRGM1R0hIUlVJVTkwSEY4STF5N0pLQ3pWNXRYWENCeW9z?=
 =?utf-8?B?SVBJT1JxR2l6cTBTZnJHemVNR1k5N1oxVlp1bG0vdTRSazRuSTlhYUloMUd4?=
 =?utf-8?B?NjE4ZitjT2dwV3BpSVZwWS9uMUNZSGc0OUt4cEhXbjMwNnhqUHhMSnpMcWZB?=
 =?utf-8?B?ZlM0S2FvQnZtS3pqbXVYV253TCtFbm9vWkIyYmV2UlJTaTI5QXZzWS9lRHJw?=
 =?utf-8?B?Y0VEUEtSYTFQcVhVQXlNZWdwQ3VFUlRwVWRJY0NST3JKbTVDNHhNMzJnZ0oy?=
 =?utf-8?B?dzk4bnVqVEpVZWVYeVNEMnliQ2tXVUpxL0ZtNG5VMEFSN1BTSzBkdmhRK3lS?=
 =?utf-8?B?dEFZdHBCWHhzcUxTTGV4VzlBb0N3UmVKK3EyYXVVSEtQWk5GaGllOWp6OWdw?=
 =?utf-8?B?M2JrT0RjSjdmR3NIWnNyN0FhMWc0VTJ6VkowUkgvZ08zWHR0ZDFxTExKYVg1?=
 =?utf-8?B?NTIrRDRPUFAzbDdHb0EyMUxHdzQxL2grK0NOT09lR0ZXQ1VSRzVHTmdBcDRz?=
 =?utf-8?B?YXF3YXVnMjhQLzM1S3lxTVJiWGRZY1ozcm93V2h4VHFGUkxXQW9DcVROY3hu?=
 =?utf-8?B?YUtYRTFiUzlpSWUyek5kVVhhV1F2d3MyQXBsMXZXVktQT2pHQmdqTlJEZ3h5?=
 =?utf-8?B?MWFaMGVoWlZsZGpydnNkV2xRREM4dmRkT0RJUmRCR1BnQkVvcTFuTTNmWklF?=
 =?utf-8?B?ZnIyM2x2OFROSnpHQVZnK0k0UnZNTW12TFRaQjlPbTNIaE9nOThCQTNqMzVi?=
 =?utf-8?B?WlRMTzNqTDByWjVVNjRHM0t4RDRGT2VHT29zcFNCL2UvcVhnQnhHOWFCWStF?=
 =?utf-8?B?WUkxTU1sUi9ReHVHVkh6ZWFMZDl2T1pBbEk0WTVUY3RzVWpiOXlOQ2hBdXZK?=
 =?utf-8?B?SEMzbzNVNTVzNWtMN3lWOEJ0bStteEZnNy9jN3dCdFJiY3h1K0dHaHU2VGhi?=
 =?utf-8?B?NTJaZXNkK0lqK2tJNzNac0N4emcraEdMbm9xMVhvSitnN3h4R1ZaUjNud3dZ?=
 =?utf-8?B?b05pUjhZaHNXOGJtSUJMd2lpTEFrMUZDOU5uYzZQNHVHelpldkR1ZlVhM3dH?=
 =?utf-8?B?WldsL2pxb1dqaTZOaWhTYzZnMnc4Q002L1pSbFFodWhGN3F5b3VwRW1zL0FP?=
 =?utf-8?B?bDRSbWpRcUg5TnV6YklpdHV5Wk1IeklUZ1NxWHFaKytORWJnK0ppT1BHRUdx?=
 =?utf-8?B?ODgyUG5SWlZRR0FNbHRLZC9GblBVenFJM05BdkVDRnlRZXFSVUsrZ0hvN1NO?=
 =?utf-8?Q?pwtkrfX2GGnjj+tudzcLURiDyjmvql4lR4a/H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc46579-5f66-4e68-7070-08df3071cd33
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:22:24.2880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogzeH9hBjmvSjF8Euqg4ZYB/aBRv4MNBKyTfxl1Sy1lFjOD1Lrh954orwNauF1IDKpRRP25W4/EzmnG6JbmpEKYTLKesiKvGJuAjn/cKcsItoDUqC+cTIWh0uDg0eYpi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_122228_295562_2F77801A 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Mon, 21 Sep 2026 20:28:17 -0400, Jaidev Shastri wrote:
> sm-cpu, sm-lmm and sm-misc export helpers such as scmi_imx_cpu_start()
> and scmi_imx_lmm_info() to imx_rproc, fsl_sai and the i.MX SOF driver.
> Each helper gates on the file-scope protocol handle:
>
> 	if (!ph)
> 		return -EPROBE_DEFER;
> 	return imx_cpu_ops->cpu_start(ph, ...);
>
> [...]

Applied to imx/drivers-intend (will apear in linux-next after v7.4-rc1),
thanks!

[1/1] firmware: imx: sm: publish the protocol handle after the ops pointer
      commit: cbbf9f9c96e875c6ffdc505b2175f3a95e33b4ab

Best regards,
--
Frank Li <Frank.Li@nxp.com>

